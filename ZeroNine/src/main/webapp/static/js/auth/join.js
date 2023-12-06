function selectAll(selectAll){
	const checkboxes = document.getElementsByName('agree');
	
	checkboxes.forEach((checkbox)=>{
		checkbox.checked = selectAll.checked;
	})
}