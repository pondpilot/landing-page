#!/usr/bin/env node
// Generates an importable GTM container for pondpilot.io from the event list
// in assets/js/analytics.js (TRACKED_EVENTS and PARAMS), so the site code and
// the container cannot drift apart. GTM forwards a parameter to GA4 only if the
// container has a Data Layer Variable for it AND the event tag maps it, and it
// forwards an event only if the Custom Event regex matches it. Anything missing
// is dropped silently. Same pattern as the 8fde and Alchemist generators.
//
// Zero dependencies, Node 18+. Not part of the Jekyll build (scripts/ is
// excluded in _config.yml).
//
// Usage:
//   node scripts/generate-gtm-container.mjs --measurement-id G-XXXXXXXXXX \
//     [--gtm-id GTM-XXXXXXX] [--account-id 123] [--container-id 456] \
//     [--out path/to/gtm-container.json]
//
// Then in GTM: Admin -> Import Container -> choose the file -> Merge (or
// Overwrite on an empty container) -> Preview -> Submit/Publish.

import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const repoRoot = resolve(dirname(fileURLToPath(import.meta.url)), '..');

function parseArgs(argv) {
  const args = {};
  for (let i = 0; i < argv.length; i++) {
    const key = argv[i];
    if (!key.startsWith('--')) throw new Error(`Unexpected argument: ${key}`);
    const value = argv[i + 1];
    if (value === undefined || value.startsWith('--')) throw new Error(`Missing value for ${key}`);
    args[key.slice(2)] = value;
    i++;
  }
  return args;
}

const args = parseArgs(process.argv.slice(2));
const measurementId = args['measurement-id'];
if (!measurementId || !/^G-[A-Z0-9]+$/.test(measurementId)) {
  console.error('Usage: node scripts/generate-gtm-container.mjs --measurement-id G-XXXXXXXXXX [--gtm-id GTM-XXXXXXX] [--account-id N] [--container-id N] [--out file]');
  console.error('The measurement ID must be a G- id: a GA4 Event tag rejects a GT- id.');
  process.exit(1);
}
const gtmId = args['gtm-id'] || 'GTM-XXXXXXX';
const accountId = args['account-id'] || '0';
const containerId = args['container-id'] || '0';
const outPath = resolve(args.out || 'gtm-container.json');

// Read the event names and params from the site code.
const source = await readFile(resolve(repoRoot, 'assets/js/analytics.js'), 'utf8');
function readArray(name) {
  const match = source.match(new RegExp(`var ${name} = \\[([^\\]]*)\\];`));
  if (!match) throw new Error(`Could not find "var ${name} = [...]" in assets/js/analytics.js`);
  const items = [...match[1].matchAll(/'([a-z0-9_]+)'/g)].map((m) => m[1]);
  if (!items.length) throw new Error(`${name} in assets/js/analytics.js is empty`);
  return items;
}
const TRACKED_EVENTS = readArray('TRACKED_EVENTS');
const PARAMS = readArray('PARAMS');

const base = { accountId, containerId };

const builtInVariable = [
  ['PAGE_URL', 'Page URL'],
  ['PAGE_HOSTNAME', 'Page Hostname'],
  ['PAGE_PATH', 'Page Path'],
  ['REFERRER', 'Referrer'],
  ['EVENT', 'Event'],
].map(([type, name]) => ({ ...base, type, name }));

const variable = [
  {
    ...base,
    variableId: '1',
    name: 'GA4 measurement ID',
    type: 'c',
    formatValue: {},
    parameter: [{ type: 'TEMPLATE', key: 'value', value: measurementId }],
  },
  ...PARAMS.map((param, index) => ({
    ...base,
    variableId: String(10 + index),
    name: `DLV - ${param}`,
    type: 'v',
    formatValue: {},
    parameter: [
      { type: 'INTEGER', key: 'dataLayerVersion', value: '2' },
      { type: 'BOOLEAN', key: 'setDefaultValue', value: 'false' },
      { type: 'TEMPLATE', key: 'name', value: param },
    ],
  })),
];

const trigger = [
  {
    ...base,
    triggerId: '100',
    name: 'PondPilot - custom events',
    type: 'CUSTOM_EVENT',
    customEventFilter: [
      {
        type: 'MATCH_REGEX',
        parameter: [
          { type: 'TEMPLATE', key: 'arg0', value: '{{_event}}' },
          // Anchored so GTM's own gtm.* events cannot match.
          { type: 'TEMPLATE', key: 'arg1', value: `^(${TRACKED_EVENTS.join('|')})$` },
        ],
      },
    ],
  },
];

// Consent settings stay NOT_SET ("No additional consent required"), as on the
// sibling sites: requiring analytics_storage would stop the tags firing at all
// while consent is denied, so no cookieless pings and no modelling.
const tag = [
  {
    ...base,
    tagId: '1',
    name: 'GA4 - Google tag',
    type: 'googtag',
    parameter: [{ type: 'TEMPLATE', key: 'tagId', value: '{{GA4 measurement ID}}' }],
    // 2147479573: GTM's built-in "Initialization - All Pages" trigger, the
    // same id the 8fde and Alchemist containers use.
    firingTriggerId: ['2147479573'],
    tagFiringOption: 'ONCE_PER_EVENT',
    monitoringMetadata: { type: 'MAP' },
    consentSettings: { consentStatus: 'NOT_SET' },
  },
  {
    ...base,
    tagId: '2',
    name: 'GA4 - custom events (all)',
    type: 'gaawe',
    parameter: [
      { type: 'BOOLEAN', key: 'sendEcommerceData', value: 'false' },
      {
        type: 'LIST',
        key: 'eventSettingsTable',
        list: PARAMS.map((param) => ({
          type: 'MAP',
          map: [
            { type: 'TEMPLATE', key: 'parameter', value: param },
            { type: 'TEMPLATE', key: 'parameterValue', value: `{{DLV - ${param}}}` },
          ],
        })),
      },
      // One tag forwards every event, rather than one tag per event.
      { type: 'TEMPLATE', key: 'eventName', value: '{{Event}}' },
      { type: 'TEMPLATE', key: 'measurementIdOverride', value: '{{GA4 measurement ID}}' },
    ],
    firingTriggerId: ['100'],
    tagFiringOption: 'ONCE_PER_EVENT',
    monitoringMetadata: { type: 'MAP' },
    consentSettings: { consentStatus: 'NOT_SET' },
  },
];

const containerPath = `accounts/${accountId}/containers/${containerId}`;

const output = {
  exportFormatVersion: 2,
  // Fixed, not a timestamp: regenerating with the same input gives the same file.
  exportTime: '2026-11-23 00:00:00',
  containerVersion: {
    path: `${containerPath}/versions/0`,
    accountId,
    containerId,
    containerVersionId: '0',
    name: 'PondPilot measurement setup',
    description:
      'Google tag on all pages, plus one GA4 event tag forwarding every tracked click event with its parameters. Generated by scripts/generate-gtm-container.mjs from assets/js/analytics.js.',
    container: {
      path: containerPath,
      accountId,
      containerId,
      name: 'pondpilot.io',
      publicId: gtmId,
      usageContext: ['WEB'],
      tagManagerUrl: `https://tagmanager.google.com/#/container/${containerPath}/workspaces?apiLink=container`,
    },
    tag,
    trigger,
    variable,
    builtInVariable,
  },
};

await mkdir(dirname(outPath), { recursive: true });
await writeFile(outPath, `${JSON.stringify(output, null, 2)}\n`);
console.log(
  `Wrote ${outPath}: ${tag.length} tags, ${trigger.length} trigger, ${variable.length} variables ` +
    `(${PARAMS.length} params, ${TRACKED_EVENTS.length} events: ${TRACKED_EVENTS.join(', ')}).`,
);
