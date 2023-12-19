<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/detailView.css" />


</head>
<body>
	<div id="detail_modal_wrap">

		<div id="detail_modal_body">
			<div class="detail_body">
				<button class="close_btn" onclick="close_btn()">
					<img src="${path}/images/common/close.png">
				</button>
				<div class="detail_chn_area">
					<div class="detail_chart">
						<span class="rate"> ${(detailFree.sum*100)/50000} % </span>
					</div>

					<div class="detail_pro_detail">
						<p class="title">${detailFree.title}</p>
						<hr>
						<ul>
							<li><img class="box" src="${path}/images/board/graph.png">
								<span id="detail_ratio"> ${(detailFree.sum*100)/50000} % </span></li>
							<li><img class="card" src="${path}/images/board/card.png">
								<span id="datail_last"> ${50000-detailFree.sum}원 남음 </span></li>
							<li><img class="clock" src="${path}/images/board/clock.png">
								<fmt:parseDate value="${detailFree.finishTime}" var="parsedDate"
									pattern="yyyy-MM-dd HH:mm" /> <span> <fmt:formatDate
										value="${parsedDate}" pattern="YY년 MM월 dd일 HH:mm" /> 까지
							</span></li>
						</ul>
						<hr>
						<p class="content">${detailFree.boardContent}</p>
					</div>
				</div>
				<div class="join_btn_div">
					<button class="join_btn">참여하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

var max = ${(detailFree.sum*100)/50000};
var color = max<35?'#09244B':max>=35 && max<70?'#F1C21B':'#F11B1B';
var back = max<35?'#7390BA':max>=35 && max<70?'#F9E59E':'#F99E9E';

draw(max, '.detail_chart', color, back );
function draw(n, classname, colorname, backgroundColor){
	   var i=1;
	    var func1 = setInterval(function(){
	      if(i<=n){
	    	  color1(i,classname, color, back);
	          i++;
	      } else{
	        clearInterval(func1);
	      }
	    },10);
	};

	function color1(i, classname,colorname,backgroundColor){
	   $(classname).css({
		   "background":"conic-gradient("+colorname+" 0% " + i + "%, "+ backgroundColor + " " + i + "% 100%)"
	   });
	};
	
	

</script>
</html>