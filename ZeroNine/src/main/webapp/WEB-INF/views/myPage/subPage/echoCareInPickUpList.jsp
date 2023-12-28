<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="contents pickup_history_wrap">
	<div class="search_wrap">
		<div class="period">
			<span>기간</span>
			<button class="on" data-period="1">1개월</button>
			<button data-period="3">3개월</button>
			<button data-period="6">6개월</button>
			<div class="calendar">
				<input type="text" data-range="true"
					data-multiple-dates-separator=" - " data-language="ko"
					id="datepicker">
			</div>
		</div>
	</div>
	<div class="tbl_top_wrap">
	
		<div class="total_count">
			총 <span>${pickUpListCount}</span>건
		</div>
	</div>
	
	<div class="tbl_wrap">
		<table class="tbl_chat_wrap">
			<colgroup>
				<col width="12%" />
				<col width="54%" />
				<col span="2" />
			</colgroup>
			<thead>
				<tr>
					<th>회수 신청 일자</th>
					<th>과거 회수 내역</th>
					<th>승인 여부</th>
					<th>회수 처리 결과</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${pickUpList}" var="pickupList" varStatus="status">
				<tr>
					<td>${pickupList.pickUpTime}</td>
					<td>${pickupList.isFoodWaste==false ? "일반쓰레기 회수 요청 내역" : "음식물 쓰레기 회수 요청 내역"}</td>
					<td class="status" data-value ="${pickupList.pickUpStatus}">${pickupList.pickUpStatus=="complete"? "완료" : pickupList.pickUpStatus=="ready" ? "준비 중" : pickupList.pickUpStatus=="process" ? "회수 중" : "거절"}</td>
					<td>
						<insert class="status_info" hidden> ${pickupList.pickUpStatus} </insert>
						<button class="btn_blue" value="${pickupList.pickUpId}"onclick="pickUpDetail('${pickupList.pickUpId}')" >상세 보기</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- pagination -->
	<%-- <c:if test="${booklist.size() != 0}"> --%>
	<c:if test="${pCount != 0}">
		<div class=pagination>
			<div class="pageLeft">
				<c:choose>
					<c:when test="${paginating.pageNumber<=1}">
						<button class="btnFirst" disabled="disabled">첫페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnFirst" id="btnFirst"
							onclick="javascript:PickUpList(1)">첫페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${paginating.pageNumber<=1}">
						<button class="btnPrev" disabled="disabled">이전페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnPrev" id="btnPrev"
							onclick="javascript:PickUpList(${paginating.pageNumber-1})">이전페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
			<ul class="pagingWrap">
				<c:forEach begin="${paginating.startPageNumber}"
					end="${paginating.endPageNumber}" var="i" step="1">
					<li><a href="javascript:PickUpList(${i})">${i}</a></li>
				</c:forEach>
			</ul>
			<div class="pageRight">
				<c:choose>
					<c:when test="${paginating.pageNumber==paginating.maxPageNumber}">
						<button class="btnNext" id="btnNext" disabled="disabled">다음페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnNext" id="btnNext"
							onclick="javascript:PickUpList(${paginating.pageNumber+1})">다음페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${paginating.pageNumber==paginating.maxPageNumber}">
						<button class="btnLast" disabled="disabled">마지막페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnLast" id="btnLast"
							onclick="javascript:PickUpList(${paginating.maxPageNumber})">마지막페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:if>
	<%-- </c:if> --%>
	<!-- //pagination -->
</div>




<!-- pagination -->

<script type="text/javascript">
	usingDatePicker();
	$(color);
	var result;
	function color(){
		 $(".status").each(function(){
			 result = $(this).text();
			 if(result == "완료"){
				 $(this).css("color" , "#0F82FF");
			 } else if(result == "거절"){
				 $(this).css("color" , "red");
			 }
		 })
	}
	
	
</script>
