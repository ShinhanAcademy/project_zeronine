	
//loadMore
function loadMore(data){ 
	keyword = $("#search").val();
	console.log(keyword);
	if(keyword==""){
		console.log("aa");
		var data = data_json;
	} else{
		console.log("bb");
		data = result;
	}
	console.log(data);
	
	var totalLength = data.length;
	
	if(endNum  < totalLength){
	console.log(data);
		$("#loadMore_btn").show();
		showHtml(data.slice(initNum, initNum+9));
		console.log(endNum);
		endNum = initNum+8;
		initNum += 9;
		if(endNum >= totalLength){
		$("#loadMore_btn").hide();
			} 
		}
	}