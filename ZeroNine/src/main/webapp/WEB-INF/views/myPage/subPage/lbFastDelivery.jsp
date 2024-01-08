<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="tbl_top_wrap">
	<div class="total_count">

		총 <span>${count}</span>건
	</div>
	<div class="delivery_kind">
		<span class="btn_deli on" id="fastDelivery">즉배</span> <span>|</span> <span
			class="btn_deli" id="freeDelivery">무배</span>
	</div>
	
</div>
<table class="tbl_chat_wrap">

	<colgroup>
		<col width="20%" />
		<col width="35%" />
		<col width="15%" />
		<col width="18%" />
		<col width="12%" />

	</colgroup>
	<thead>
		<tr>
			<th>상품</th>
			<th>게시글 제목</th>
			<th>게시일</th>
			<th>마감 기한</th>
			<th>더보기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${info}" var="board" varStatus="status">
			<tr>
				<td><img class="product_image" src="${board.imagePath}">
				
				<button class="btn_like" id="like${status.index}" onclick="handleLikeButtonClick(${status.index},'${board.boardId}')">
												
												<c:if test="${fn:contains(likedbid, board.boardId)}">
													<img class="board_heart"   
														src="${path}/images/board/red_heart.png">
												</c:if>
												<c:if
													test="${not(fn:contains(likedbid, board.boardId))}">
													<img class="board_heart"   
														src="${path}/images/board/heart.png">
												</c:if>
												
												
												</button>
				
				</td>
				<td class="td_font_title">${board.title}</td>
				<td class="td_font_upload">${board.uploadTime}</td>
				<td class="td_font_remain">${board.remainTime}</td>
				<td class="read_status"><input id="hiddenBoardId" type="hidden"
					value="${board.boardId}">
					<button class="boardDetail">상세보기</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
var path = "${path}";

var str = "${likedbid}";
var likedbidArr = [] ; 
likedbidArr = str.split(/,|\[|\]| /);

function handleLikeButtonClick(index, boardId) {
	
	var likeButtonId = "like" + index;

	//클래스가 heart liked => AJAX DELTE 호출
    var isRedHeart = likedbidArr.indexOf(boardId);
	
	if(isRedHeart>=0) {
		$.ajax({
			url : path + "/myPage/subPage/deleteLikedBoard.do",
			type: "GET",
			data : {"boardId" :boardId},
			success : function(){
				likedbidArr = likedbidArr.filter((element) => element !== boardId);
			},
			error : function(){
				alert("에러입니다.");
			}
			});
			 
		}else{

		 $.ajax({
				url : "/myPage/subPage/insertLikedBoard.do",
				type: "GET",
				data : {"boardId" :boardId},
				success : function(){
						likedbidArr.push(boardId);
				},
				error : function(){
					alert("에러입니다.");
				}
				});
		}
			};
$(".btn_like").click(function (){

	var currentImagePath = $(this).find("img.board_heart").attr("src");
	var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
	    path+"/images/board/red_heart.png" :
	    path+"/images/board/heart.png";
	$(this).find("img.board_heart").attr("src", newImagePath);
	});
</script>
<script src="${path}/js/myPage/likeBoard.js" type="text/javascript"></script>