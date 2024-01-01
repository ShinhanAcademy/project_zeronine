// $(window).ready(function(){
//    draw(80, '.pie-chart', '#F11B1B');
// });

function draw(max, classname) {
	let pointColor = "";
	let backColor = "";
	
	if(max<35) {
		pointColor = "#09244B";
		backColor = "#7390BA";
	} else if(max>=35 && max<70) {
		pointColor = "#F1C21B";
		backColor = "#F9E59E";
	} else {
		pointColor = "#F11B1B";
		backColor = "#F99E9E";
	}
	
	let i=1;
    
    var func1 = setInterval(function() {
      if(i<max){
          callColor(i, classname, pointColor, backColor);
          i++;
      } else{
        clearInterval(func1);
      }
    }, 10);
};

function callColor(i, classname, pointColor, backColor){
   $(classname).css({
      "background": `conic-gradient(${pointColor} 0% ${i}%, ${backColor} ${i}% 100%)`
   });
};