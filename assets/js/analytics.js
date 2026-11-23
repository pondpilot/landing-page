/**
 * PondPilot click events for GA4, delivered through Google Tag Manager.
 *
 * Loaded only when GTM is on (see _layouts/default.html).
 *
 * Events go out as `dataLayer.push({ event, ...params })`, never as
 * `gtag('event', ...)`: under GTM a bare gtag('event') push has a shape the
 * Custom Event trigger does not match, so it would reach nothing. Consent is
 * handled upstream by Consent Mode v2 (GA4 sends a cookieless ping while
 * analytics_storage is denied), so pushes need no gating here.
 *
 * TRACKED_EVENTS and PARAMS are read by scripts/generate-gtm-container.mjs to
 * build the GTM container. Keep them as plain one-line arrays of quoted
 * strings, and regenerate + re-import the container after changing either:
 * an event the container's regex does not match is pushed and then dropped.
 */
(function () {
    'use strict';

    var TRACKED_EVENTS = ['cta_app_click', 'cta_flowscope_click', 'cta_widget_click', 'github_click', 'npm_click'];
    var PARAMS = ['location', 'link_url', 'link_text', 'page_type'];

    // Destination decides the event. First match wins.
    function eventFor(host) {
        if (host === 'app.pondpilot.io') return 'cta_app_click';
        if (host === 'flowscope.pondpilot.io') return 'cta_flowscope_click';
        if (host === 'widget.pondpilot.io') return 'cta_widget_click';
        if (host === 'github.com' || /\.github\.com$/.test(host)) return 'github_click';
        if (host === 'npmjs.com' || /\.npmjs\.com$/.test(host)) return 'npm_click';
        return null;
    }

    // Where the link sits: the header nav, the footer, the hero, the closing
    // CTA band, another section by its id, an article body, or the page body.
    function linkLocation(a) {
        if (a.closest('header')) return 'nav';
        if (a.closest('footer')) return 'footer';
        var section = a.closest('section');
        if (section) {
            if (section.classList.contains('hero')) return 'hero';
            if (section.classList.contains('cta')) return 'final_cta';
            if (section.id) return section.id.replace(/-/g, '_');
        }
        if (a.closest('article')) return 'article';
        return 'body';
    }

    // First path segment, or "home" for "/": app, flowscope, widget, blog,
    // duckdb, alternatives, formats, use-cases, ...
    function pageType(path) {
        var slug = path.replace(/^\/+|\/+$/g, '').split('/')[0];
        return slug || 'home';
    }

    // GA4 keeps parameter values up to 100 characters.
    function clip(value) {
        return value.length > 100 ? value.slice(0, 100) : value;
    }

    function linkText(a) {
        var text = (a.textContent || '').replace(/\s+/g, ' ').trim();
        return clip(text || a.getAttribute('aria-label') || a.getAttribute('title') || '');
    }

    // GTM's data layer is cumulative: a key pushed once stays. Every push
    // writes every known param, `undefined` when an event does not set it, so
    // no event inherits a value left by an earlier one.
    function track(event, params) {
        var payload = { event: event };
        for (var i = 0; i < PARAMS.length; i++) {
            payload[PARAMS[i]] = params[PARAMS[i]];
        }
        window.dataLayer = window.dataLayer || [];
        window.dataLayer.push(payload);
    }

    function onClick(e) {
        // Left click, or a middle click that opens the link in a new tab.
        if (e.type === 'auxclick' && e.button !== 1) return;
        var a = e.target && e.target.closest ? e.target.closest('a[href]') : null;
        if (!a) return;
        var url;
        try {
            url = new URL(a.getAttribute('href'), window.location.href);
        } catch (err) {
            return;
        }
        if (url.protocol !== 'http:' && url.protocol !== 'https:') return;
        var event = eventFor(url.hostname);
        if (!event || TRACKED_EVENTS.indexOf(event) === -1) return;
        track(event, {
            location: linkLocation(a),
            link_url: clip(url.href),
            link_text: linkText(a),
            page_type: pageType(window.location.pathname)
        });
    }

    document.addEventListener('click', onClick);
    document.addEventListener('auxclick', onClick);
})();
