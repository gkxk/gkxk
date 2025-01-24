// ==UserScript==
// @name         wordhl
// @include      *
// @version      0.1
// @description  wordhl extension
// @namespace    http://gkxk.github.io/
// @author       gkxk
// @icon         http://gkxk.github.io/im/avatar.jpg
// @license      MIT
// @grant        GM_getValue
// @grant        GM_setValue
// @grant        GM_xmlhttpRequest
// ==/UserScript==

(function () {
	//---------------- util tools ----------------
	// notify
	function notify(text) {
		// show a auto-fadeout notification
		var notification = document.createElement('div');
		notification.innerHTML = `${text}`;
		notification.style.cssText = "font-size:16px;position:fixed;top:10px;left:10px;padding:5px 10px;background:#000;color:#fff;border-radius:5px;opacity:0.8;z-index:9999;transition:opacity 3s ease";
		document.body.appendChild(notification);
		setTimeout(function() {
			notification.style.cssText = "font-size:16px;position:fixed;top:10px;left:10px;padding:5px 10px;background:#000;color:#fff;border-radius:5px;opacity:0;z-index:9999;transition:opacity 3s ease";
			setTimeout(function() {
				document.body.removeChild(notification);
			}, 3000);
		}, 3000);
	}

	// copy to clipboard
	function copy2clip(text) {
		const textarea = document.createElement('textarea');
		textarea.value = text;
		textarea.style.position = 'fixed';
		textarea.style.top = '-9999px';
		textarea.style.left = '-9999px';
		document.body.appendChild(textarea);

		textarea.select();
		try {
			document.execCommand('copy');
			console.log('Text copied to clipboard');
		} catch (error) {
			console.error('Failed to copy text to clipboard', error);
		}
		// Remove the textarea from the DOM
		document.body.removeChild(textarea);
	}

	// string to color
	function str2color(text){
		// text 2 random color, in rgba
		var hash = 0;
		for (let i = 0; i < text.length; i++) {
			hash = text.charCodeAt(i) + ((hash << 5) - hash);
		}
		var color = '#';
		for (let i = 0; i < 3; i++) {
			// 0x11 ~ 0xEE
			let value = 0x11 + (hash >> (i * 8)) % (0xEE - 0x11);
			color += ('00' + value.toString(16)).substr(-2);
		}
		return color;
	}

	// highlight word
	function highlight_word(wordhl){
		let wordhl_reg = new RegExp(`${wordhl}`, 'g')
		let wordhl_html = `<span class='wordhl' style='background:${str2color(wordhl)}'>${wordhl}</span>`
		// document.body.innerHTML = document.body.innerHTML.replaceAll(wordhl_reg, wordhl_html)

		// let tags = ['a', 'p', 'div', 'li', 'td', 'th', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'pre']
		let tags = ['p', 'pre', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6']
		tags.forEach(tag => {
			let doms = document.getElementsByTagName(tag)
			for (let i = 0; i < doms.length; i++) {
				let dom = doms[i]
				if (dom.innerHTML.includes(wordhl_html)) continue
				dom.innerHTML = dom.innerHTML.replaceAll(wordhl_reg, wordhl_html)
				console.log(`highlight ${wordhl} in ${tag}`)
			}
		})
	}

	// de-highlight word
	function try_dehighlight_word(wordhl){
		let wordhl_html = `<span class="wordhl" style="background:${str2color(wordhl)}">${wordhl}</span>`
		// if contains wordhl_html
		if (document.body.innerHTML.includes(wordhl_html)){
			document.body.innerHTML = document.body.innerHTML.replaceAll(wordhl_html, wordhl)
			return true
		}
		return false
	}

	// css
	let style = document.createElement('style')
	style.innerHTML = `
		span.wordhl {
			background-color: yellow;
			color: black;
			padding: 0px 2px;
			border-radius: 2px;
			font-weight: bold;
		}`
	document.head.appendChild(style)


	//---------------- highlight from location.search ----------------
	setTimeout(function () {
		// select wordhl value from location.search
		let wordhl = new URLSearchParams(location.search).get('highlight')
		if(!wordhl) return

		// highlight wordhl in page
		highlight_word(wordhl)

		// scroll to wordhl
		let wordhl_dom = document.querySelector('span.wordhl')
		if (wordhl_dom) {
			wordhl_dom.scrollIntoView()
		}
	}, 1000 * 1)


	//---------------- select word and highlight ----------------
	// bind ctrl-D to button click. override default browser behavior
	document.addEventListener('keydown', function (event) {
		if (event.ctrlKey && event.key === 'd') {
			let selection = window.getSelection();
			// if has selected content, and select only one word
			if (selection.toString().trim().length > 0 && selection.toString().trim().split(/\s+/).length === 1) {
				event.preventDefault();
				let wordhl = selection.toString().trim()
				let cached_wordhls = JSON.parse(localStorage.getItem('wordhls') || '[]')
				if(try_dehighlight_word(wordhl)){
					// already highlighted, then de-highlight
					localStorage.setItem('wordhls', JSON.stringify(cached_wordhls.filter(w => w !== wordhl)))
				}else{
					highlight_word(wordhl)
					cached_wordhls.push(wordhl)
					localStorage.setItem('wordhls', JSON.stringify(cached_wordhls))
				}
			}
			// if alt-ctrl-d
			else if (event.altKey) {
				event.preventDefault();
				// find all span.wordhl as list
				let wordhls = document.querySelectorAll('span.wordhl')
				let words = new Set()
				wordhls.forEach(wordhl => {
					words.add(wordhl.innerText)
				})
				// notify
				copy2clip(Array.from(words)[0])
				let cached_wordhls = JSON.parse(localStorage.getItem('wordhls') || '[]')
				let others = cached_wordhls.filter(w => !words.has(w))
				notify(`current: ${Array.from(words).join(', ')}<br>others: ${others.join(', ')}`)
			}
		}
	})

	// highlight cached words, 1s later
	setTimeout(function () {
		let wordhls = JSON.parse(localStorage.getItem('wordhls') || '[]')
		wordhls.forEach(wordhl => {
			highlight_word(wordhl)
		})
	}, 1000 * 1)
})();