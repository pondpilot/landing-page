/**
 * PondPilot Site JavaScript
 * Shared functionality for navigation, dropdowns, and scroll effects
 */

(function() {
    'use strict';

    // DOM elements with null safety
    const mobileToggle = document.querySelector('.mobile-toggle');
    const nav = document.querySelector('nav');
    const header = document.querySelector('header');
    const dropdownTriggers = document.querySelectorAll('.nav-dropdown-trigger');

    // Mobile Navigation
    function initMobileNav() {
        if (!mobileToggle || !nav) return;

        const navLinks = document.querySelectorAll('nav a');

        function toggleMobileMenu() {
            const isActive = nav.classList.toggle('active');
            mobileToggle.classList.toggle('active');
            document.body.classList.toggle('menu-open');
            mobileToggle.setAttribute('aria-expanded', isActive);
        }

        function closeMobileMenu() {
            nav.classList.remove('active');
            mobileToggle.classList.remove('active');
            document.body.classList.remove('menu-open');
            mobileToggle.setAttribute('aria-expanded', 'false');
        }

        mobileToggle.addEventListener('click', toggleMobileMenu);

        navLinks.forEach(function(link) {
            link.addEventListener('click', closeMobileMenu);
        });

        document.addEventListener('click', function(event) {
            var isClickInsideNav = nav.contains(event.target);
            var isClickOnToggle = mobileToggle.contains(event.target);

            if (!isClickInsideNav && !isClickOnToggle && nav.classList.contains('active')) {
                closeMobileMenu();
            }
        });

        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape' && nav.classList.contains('active')) {
                closeMobileMenu();
                mobileToggle.focus();
            }
        });
    }

    // Dropdown Navigation with Keyboard Accessibility
    function initDropdownNav() {
        dropdownTriggers.forEach(function(trigger) {
            var dropdown = trigger.closest('.nav-dropdown');
            var menu = dropdown ? dropdown.querySelector('.dropdown-menu') : null;

            if (!menu) return;

            function openDropdown() {
                trigger.setAttribute('aria-expanded', 'true');
                menu.classList.add('is-open');
            }

            function closeDropdown() {
                trigger.setAttribute('aria-expanded', 'false');
                menu.classList.remove('is-open');
            }

            function toggleDropdown() {
                var isExpanded = trigger.getAttribute('aria-expanded') === 'true';
                if (isExpanded) {
                    closeDropdown();
                } else {
                    openDropdown();
                }
            }

            // Click to toggle
            trigger.addEventListener('click', function(e) {
                e.preventDefault();
                toggleDropdown();
            });

            // Keyboard navigation
            trigger.addEventListener('keydown', function(e) {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    toggleDropdown();
                } else if (e.key === 'ArrowDown') {
                    e.preventDefault();
                    openDropdown();
                    var firstItem = menu.querySelector('.dropdown-item');
                    if (firstItem) firstItem.focus();
                } else if (e.key === 'Escape') {
                    closeDropdown();
                    trigger.focus();
                }
            });

            // Menu item keyboard navigation
            var menuItems = menu.querySelectorAll('.dropdown-item');
            menuItems.forEach(function(item, index) {
                item.addEventListener('keydown', function(e) {
                    if (e.key === 'ArrowDown') {
                        e.preventDefault();
                        var nextItem = menuItems[index + 1] || menuItems[0];
                        nextItem.focus();
                    } else if (e.key === 'ArrowUp') {
                        e.preventDefault();
                        var prevItem = menuItems[index - 1] || menuItems[menuItems.length - 1];
                        prevItem.focus();
                    } else if (e.key === 'Escape') {
                        closeDropdown();
                        trigger.focus();
                    }
                });
            });

            // Close when clicking outside
            document.addEventListener('click', function(e) {
                if (!dropdown.contains(e.target)) {
                    closeDropdown();
                }
            });

            // Close on focus outside (for keyboard users)
            dropdown.addEventListener('focusout', function(e) {
                setTimeout(function() {
                    if (!dropdown.contains(document.activeElement)) {
                        closeDropdown();
                    }
                }, 0);
            });
        });
    }

    // Header Scroll Effect
    function initHeaderScroll() {
        if (!header) return;

        function handleScroll() {
            if (window.scrollY > 20) {
                header.setAttribute('data-scrolled', 'true');
            } else {
                header.setAttribute('data-scrolled', 'false');
            }
        }

        window.addEventListener('scroll', handleScroll, { passive: true });
        handleScroll();
    }

    // Scroll Animations with IntersectionObserver
    function initScrollAnimations() {
        var elements = document.querySelectorAll('.scroll-animate');
        if (!elements.length) return;

        if (!('IntersectionObserver' in window)) {
            elements.forEach(function(el) {
                el.classList.add('is-visible');
            });
            return;
        }

        var observer = new IntersectionObserver(function(entries) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) {
                    entry.target.classList.add('is-visible');
                    observer.unobserve(entry.target);
                }
            });
        }, {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        });

        elements.forEach(function(el) {
            observer.observe(el);
        });

        // Add stagger class to grids
        var featureGrid = document.querySelector('.feature-grid');
        if (featureGrid) featureGrid.classList.add('stagger-children');

        var productGrid = document.querySelector('.product-grid');
        if (productGrid) productGrid.classList.add('stagger-children');
    }

    // Initialize all functionality
    function init() {
        initMobileNav();
        initDropdownNav();
        initHeaderScroll();
        initScrollAnimations();
    }

    // Run when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
