// ==UserScript==
// @name         Any site into PWA
// @author       gkxk
// @namespace    http://tampermonkey.net/
// @version      0.2
// @description  Make any site into PWA
// @match        *://*/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Create and add a manifest link element
    const manifestLink = document.createElement('link');
    manifestLink.rel = 'manifest';

    // Create manifest JSON dynamically
    const manifestJSON = {
        "name": document.title || "Sample PWA",
        "short_name": (document.title || "PWA").substring(0, 12),
        "start_url": location.href,
        "display": "standalone",
        "background_color": "#000000",
        "theme_color": "#000000",
        "description": "A sample PWA added by Tampermonkey script",
        "icons": []
    };

    // Attempt to get the largest favicon as the PWA icon
    const icons = Array.from(document.querySelectorAll('link[rel~="icon"]')).map(link => ({
        src: link.href,
        sizes: link.sizes.value || 'any',
        type: link.type || 'image/png'
    }));

    // If no icons are found, add a default placeholder
    if (icons.length === 0) {
		let title_hash = document.title.replace(/[^a-zA-Z0-9]/g, '');
        icons.push({
            src: `https://picsum.photos/seed/${title_hash}/192/192`,
            sizes: '192x192',
            type: 'image/png'
        });
        icons.push({
			src: `https://picsum.photos/seed/${title_hash}/512/512`,
            sizes: '512x512',
            type: 'image/png'
        });
    }

    manifestJSON.icons = icons;
    manifestLink.href = 'data:application/json;charset=utf-8,' + encodeURIComponent(JSON.stringify(manifestJSON));
    document.head.appendChild(manifestLink);
})();
