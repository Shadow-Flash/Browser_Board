export const enableHoverMode = () => {
	function addStyleString(str: string) {
		const node = document.createElement('style');
		node.innerHTML = str;
		document.body.appendChild(node);
	}

	addStyleString(
		'.-sitemap-select-item-hover{outline:2px solid green!important}.-sitemap-select-item-hover,.-sitemap-select-item-hover *{background-color:rgba(0,213,0,.2)!important;background:rgba(0,213,0,.2)!important}.-sitemap-select-item-selected{outline:2px solid #c70000!important}.-sitemap-select-item-selected,.-sitemap-select-item-selected *{background-color:rgba(213,0,0,.2)!important;background:rgba(213,0,0,.2)!important}'
	);

	function mouseover(event: MouseEvent) {
		const { target } = event;
		if (target instanceof HTMLElement) {
			target.classList.add('-sitemap-select-item-hover');
		}
	}
	function mouseout(event: MouseEvent) {
		const { target } = event;
		if (target instanceof HTMLElement) {
			target.classList.remove('-sitemap-select-item-hover');
		}
	}
	document.addEventListener('mouseover', mouseover, { capture: true });
	document.addEventListener('mouseout', mouseout, { capture: true });

	const removeListeners = () => {
		document.removeEventListener('mouseover', mouseover, { capture: true });
		document.removeEventListener('mouseout', mouseout, { capture: true });
	};
	return { removeListeners };
};
