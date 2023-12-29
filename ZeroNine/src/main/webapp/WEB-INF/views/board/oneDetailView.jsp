<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<img class="detail_img"
						src="${detail.oBoardImagePath}">

					<div class="detail_pro_detail">
						<p class="title"> ${detail.oTitle} </p>
						<hr>
						<ul>
						<li><img class="map_marker"
								src="${path}/images/board/map_marker.png"> <span>
									${detail.address} ${detail.addressDetail} </span></li>
							<li><img class="clock" src="${path}/images/board/clock.png">
								 <fmt:parseDate value="${detail.finishtime}" var="parsedDate" pattern="yyyy-MM-dd HH:mm"/> 
									<span> <fmt:formatDate value="${parsedDate}" pattern="YY년 MM월 dd일 HH:mm" /> 까지 </span></li>
						</ul>
						<hr>
						<p class="content"> ${detail.oContent} </p>
					</div>
				</div>
				<div class="join_btn_div">
					<button id="joinChat" class="join_btn" style="background-color:#F4B242">채팅하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var customerId = "${customerId}";
$("#joinChat").on("click", function(){
	
	if(customerId==""){
		alert("로그인 후 이용해주세요.");
		location.href = "/auth/login.do";
		return;
	}
	
	const oBoardId = "${board_id}";
	
	//console.log("oBoardId??", oBoardId);
	if(confirm("채팅에 참여하시겠습니까?")){
		$.ajax({
			url : contextPath +"/insertChatInfo.do",
			data : {oBoardId},
			type : "POST",
			success : function(result){
				location.href = "/chat.do";
				$("#detail_modal_wrap").hide();
			},
			error : function(){
				alert("에러입니다.");
			}
		})
	}
})

</script>
</html>