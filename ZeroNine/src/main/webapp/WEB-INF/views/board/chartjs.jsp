<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

//최종 그리기
function drawChart(){
	
	console.log("이것은 drawChart가 찍는 ratio_arr의 길이"+ratio_arr.length);
	console.log(ratio_arr);
	
	$(".pie-chart").each(function(index, item){
		var each_ratio = ratio_arr[index];
		var color = ratio_arr[index]<35?'#09244B':each_ratio>=35 && each_ratio<70?'#F1C21B':'#F11B1B';
		var back = ratio_arr[index]<35?'#7390BA':each_ratio>=35 && each_ratio<70?'#F9E59E':'#F99E9E';
		draw(ratio_arr[index], this, color, back)();	
	});
	
	}		

//실제 그리는 로직
function draw(max, classname, colorname, backgrounColor){
	  return function(){
		  var n=1;
		  var load = setInterval(function(){
	      if(n<=max){
	          color1(n,classname, colorname, backgrounColor);
	          n++;
	      } else{
	        clearInterval(load);
	      }
	    },10);
	  };
	};

//color 조합	
function color1(n, classname, colorname, backgroundColor){
	   $(classname).css({
	        "background":"conic-gradient("+colorname+" 0% " + n + "%, "+ backgroundColor + " " + n + "% 100%)"
	   });
	};
</script>