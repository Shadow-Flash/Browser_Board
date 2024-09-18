let removeListenerCallback = () => {};
const enableHoverMode = () => {
	function addStyleString(str) {
		const node = document.createElement('style');
		node.innerHTML = str;
		document.body.appendChild(node);
	}

	addStyleString(
		'.-sitemap-select-item-hover{outline:2px solid green!important}.-sitemap-select-item-hover,.-sitemap-select-item-hover *{background-color:rgba(0,213,0,.2)!important;background:rgba(0,213,0,.2)!important}.-sitemap-select-item-selected{outline:2px solid #c70000!important}.-sitemap-select-item-selected,.-sitemap-select-item-selected *{background-color:rgba(213,0,0,.2)!important;background:rgba(213,0,0,.2)!important}'
	);

	function mouseover(event) {
		const { target } = event;
		if (target instanceof HTMLElement) {
			target.classList.add('-sitemap-select-item-hover');
		}
	}
	function mouseClick(event) {
		const { target } = event;
		if (target instanceof HTMLElement) {
			console.log('Clicked Element', target);
		}
	}
	function mouseout(event) {
		const { target } = event;
		if (target instanceof HTMLElement) {
			target.classList.remove('-sitemap-select-item-hover');
		}
	}
	document.addEventListener('mouseover', mouseover, { capture: true });
	document.addEventListener('mouseout', mouseout, { capture: true });
	document.addEventListener('click', mouseClick, { capture: true });

	const removeListeners = () => {
		document.removeEventListener('mouseover', mouseover, { capture: true });
		document.removeEventListener('mouseout', mouseout, { capture: true });
		document.removeEventListener('click', mouseClick, { capture: true });
	};
	removeListenerCallback = removeListeners;
	return { removeListeners };
};

chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
	console.log(sender.tab ? 'from a content script:' + sender.tab.url : 'from the extension');
	if (request.message === 'enableHoverMode') {
		enableHoverMode();
		console.log('hover mode enabled!');
		sendResponse({ message: 'hover mode enabled!' });
	}
	if (request.message === 'disableHoverMode') {
		removeListenerCallback();
		sendResponse({ message: 'hover mode disabled!' });
	}

	if (request.greeting === 'hello') sendResponse({ farewell: 'goodbye' });
});
