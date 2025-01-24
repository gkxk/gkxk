// ==UserScript==
// @name         clip
// @include      *
// @version      0.1
// @description  clip extension
// @namespace    http://gkxk.github.io/
// @author       gkxk
// @icon         http://gkxk.github.io/im/avatar.jpg
// @license      MIT
// @grant        GM_getValue
// @grant        GM_setValue
// @grant        GM_xmlhttpRequest
// ==/UserScript==


function notify(text) {
	// show a auto-fadeout notification
	var notification = document.createElement('div');
	notification.innerHTML = `${text}`;
	notification.style.cssText = "position:fixed;top:10px;left:10px;padding:5px 10px;background:#000;color:#fff;border-radius:5px;opacity:0.8;z-index:9999;transition:opacity 1s ease";
	document.body.appendChild(notification);
	setTimeout(function () {
		notification.style.cssText = "position:fixed;top:10px;left:10px;padding:5px 10px;background:#000;color:#fff;border-radius:5px;opacity:0;z-index:9999;transition:opacity 1s ease";
		setTimeout(function () {
			document.body.removeChild(notification);
		}, 1000);
	}, 1000);
}


(function () {
	document.addEventListener('keydown', function (event) {
		if (event.ctrlKey && event.key === 'e') {
			console.log("Ctrl + e was pressed");
			event.preventDefault();
			if (window.getSelection) {
				var selectedText = window.getSelection().toString();
				if (selectedText.length > 0) {
					console.log("Selected Text: " + selectedText);
					let body = {
						"text": selectedText,
						"title": document.title,
						"url": window.location.href
					}
					GM_xmlhttpRequest({
						method: "POST",
						url: "http://127.0.0.1:8003",
						data: JSON.stringify(body),
						headers: {
							"Content-Type": "application/json"
						},
						onload: function (response) {
							console.log(response.responseText);
							if (response.responseText == "success") {
								notify(`copied: ${selectedText}`);
							}
						}
					});
				}
			}
		}
	});
})();