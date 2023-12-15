<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>


<title>OnetoOneBoard</title>
<link rel="stylesheet" href="${path}/css/board/boardList.css" />
<script src="../js/like.js"></script>
<script src="../js/detailView.js"></script>
</head>


<body>
	<div class="banner zn_center">

		<div style="width: 1440px">
			<img src="${path}/images/board/banner3.png"
				style="width: 100%; padding-top: 80px;">
		</div>

		<div class="search">
			<ul>
				<li>
					<div class="search_area">
						<input type="text" name="q" placeholder="상품명, 제조사 검색">
						<button type="submit"></button>
					</div>
				</li>
			</ul>
		</div>
		<div class="section zn_center">
			<div style="width: 1440px">
				<div id="filter">
					<span> <img class="filter_img"
						src="${path}/images/board/filter.png">
					</span> <select name="board_type" class="filter" onchange="filterType()">
						<option value="recent">최신순</option>
						<option value="imminent">임박순</option>
					</select>
				</div>


				<div class="edit">
					<span> <img class="edit_img"
						src="${path}/images/board/edit.png">
					</span> <span class="edit_btn"> <a style="font-size: 25px;"
						href="${path}/board/boardedit.do?boardType=oneTooneBoard"
						data-value="oneTooneBoard">글쓰기</a>
					</span>
				</div>
			</div>
		</div>
		<div id="allList">
			<%-- <c:forEach items="${infoOne}" var="oneInfo">
				<div id="list">
					<div class="pro_info">
						<ul>
							<li><img class="pro_img" src="${oneInfo.oBoardImagePath}"></li>
						</ul>


						<div class="pro_name">
							<ul>
								<li>${oneInfo.oTitle}</li>
							</ul>
						</div>
						<div class="pro_detail">
							<ul>
								<li><img class="clock" src="${path}/images/board/clock.png">
									<fmt:parseDate value="${oneInfo.finishtime}" var="parseDate"
										pattern="HHmm" /> <span><fmt:formatDate
											value="${parseDate}" pattern="HH시 mm분" /> 까지</span></li>
								<li><img class="map_marker"
									src="${path}/images/board/map_marker.png"> <span>
										${oneInfo.address} ${oneInfo.addressDetail} </span></li>
							</ul>
						</div>
						<ul>
							<li class="detail_view">
								<button class="like" type="button">
									<img class="like" src="${path}/images/board/heart.png">
								</button>
								<button id="one_detail_btn" class="detail_btn"
									value="${oneInfo.oBoardId}">보기</button>
							</li>
						</ul>
					</div>

				</div>
			</c:forEach> --%>
		</div>
		<div id="modal"></div>
	</div>


	<%@include file="../common/footer.jsp"%>
	<script src="../js/detailView.js"></script>

	<script>
	var type_of_filter ;
	
	$(filterType)
	$(boardList)
		
	function filterType() {
		type_of_filter = document.querySelector(".filter").value; 
		console.log(type_of_filter);
	}

	$(".filter").change(function() {
	    boardList();
	});
	
	var infoOne_json = JSON.parse('${infoOne}');

	function boardList(){
		console.log("ajax 뿌리는 곳 : " + type_of_filter)
		$.ajax({
			url: "${path}/board/onetooneboard.do",
			type : "get",
			success : function(responseData) {
				if(type_of_filter == 'imminent') {//임박순
					infoOne_json.sort(
						function(a, b) {
							return new Date(a.finishtime) - new Date(b.finishtime);
						}
								
					)
					console.log(infoOne_json);
				} else { //최신순 (default)
					infoOne_json.sort(
						function(a, b) {
							return new Date(b.oUploadTime) - new Date(a.oUploadTime)
						}
							
					) 
					console.log(infoOne_json);
				}
					
				var output = '';

                $.each(infoOne_json, function (index, item) {
                    var str = item.finishtime.substr(2,17);
                    output += `
                    	<div id="list">
    					<div class="pro_info">
    						<ul>
    							<li><img class="pro_img" src="\${item.oBoardImagePath}"></li>
    						</ul>


    						<div class="pro_name">
    							<ul>
    								<li>\${item.oTitle}</li>
    							</ul>
    						</div>
    						<div class="pro_detail">
    							<ul>
    								<li><img class="clock" src="${path}/images/board/clock.png">
    									<span> \${str} 까지</span></li>
    								<li><img class="map_marker"
    									src="${path}/images/board/map_marker.png"> <span>
    										\${item.address} \${item.addressDetail} </span></li>
    							</ul>
    						</div>
    						<ul>
    							<li class="detail_view">
    								<button class="like" type="button">
    									<img class="like" src="${path}/images/board/heart.png">
    								</button>
    								<button id="one_detail_btn" class="detail_btn"
    									value="\${item.oBoardId}">보기</button>
    							</li>
    						</ul>
    					</div>

    				</div>
                    `;
                });
				
                $("#allList").html(output);
			}
				
		})
	}
	</script>
</body>
</html>

