<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>

<title>FastBoard</title>
<link rel="stylesheet" href="${path}/css/board/boardList.css" />
<script src="../js/like.js"></script>
<script src="../js/board/loadMore.js"></script>

</head>
<body>

	<div class="banner zn_center">
		<div style="width: 1440px; padding: 20px 0px;">
			<img src="${path}/images/board/banner1.png" style="width: 100%">
		</div>


		<div class="search">
			<ul>
				<li>
					<div class="search_area">
						<input name="q" placeholder="상품명, 제조사 검색" id="search">
						<button type="button" onclick="check()"></button>
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
				<!-- 아이디 확인용 hidden  -->
				<div id=email data-email="{email}" hidden="hidden">${email}</div>

				<div class="edit">
					<span> <img class="edit_img"
						src="${path}/images/board/edit.png">
					</span> <span class="edit_btn"> <a style="font-size: 25px;"
						<%-- href="${path}/board/boardedit.do?boardType=fastBoard" --%>
						data-value="fastBoard"
						onclick="writeBoard()">글쓰기</a>
					</span>
				</div>
			</div>
		</div>
		<div class="List">
			<div id="allList"></div>
			<div id="load_more_btn_wrap">
			<button id="loadMore_btn" onclick="loadMore()"> 
			<img src="${path}/images/board/loadmore.png">
			</button>
			</div>
			<div id="modal"></div>
		</div>
	</div>


	<%@include file="../common/footer.jsp"%>
	<script src="../js/detailView.js"></script>

	<script type="text/javascript">


	function writeBoard(){
		var id = '${email}';
		if(id==""){
			alert("로그인 후 작성 가능합니다.");
			/* location.href="${path}/board/boardedit.do?boardType=fastBoard"; */
			location.href="${path}/auth/login.do";
		} else{
			location.href="${path}/board/boardedit.do?boardType=fastBoard";
		}
	}
	
	
	</script>


	<script>
var type_of_filter;
var info_json;
var output = "";
var path = "${path}";
var result = [];
// DOM이 준비되면 필터링 함수 호출
$(filterType);
$(searchBoard);



	// 실패 정보 파싱 및 배열 생성
    var fail_info = '${fail}';
    var fail_info_array = JSON.parse(fail_info);
    var failId_array = [];

    for (var i = 0; i < fail_info_array.length; i++) {
        var failId = fail_info_array[i].boardId;
        failId_array.push(failId);
    }
    
    //성공 정보 배열 생성
     var success_info = '${success}';
    var success_info_array = JSON.parse(success_info);
    var successId_array = [];

    for (var i = 0; i < success_info_array.length; i++) {
        var successId = success_info_array[i].boardId;
        successId_array.push(successId);
    }
    var str = "${likeBlist}";
	 var likeBlistArr = [] ; 
	 //str.split(/!|@|~|,| |Z/);
	 likeBlistArr = str.split(/,|\[|\]| /);
	 console.log(likeBlistArr);
function handleLikeButtonClick(index, boardId) {
	console.log(boardId);
    var currentImagePath = $("#btn"+index).find("img.board_like").attr("src");
    var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
        path+"/images/board/red_heart.png" :
        path+"/images/board/heart.png";
    $("#btn"+index).find("img.board_like").attr("src", newImagePath);
	        var likeButtonId = "like" + index;
	       
	    
	    	//클래스가 heart liked => AJAX DELTE 호출
	        var isRedHeart = likeBlistArr.indexOf(boardId);
	    	
			console.log(isRedHeart);
			if(isRedHeart>=0) {
				$.ajax({
					url : "/board/deletelikedboard.do",
					type: "POST",
					data : {"boardId" :boardId},
					success : function(){
						likeBlistArr = likeBlistArr.filter(item => item !== boardId);
					},
					error : function(){
						alert("에러입니다.");
					}
					});
					 
				}else{
	
				 $.ajax({
						url : "/board/fastboardlike.do",
						type: "POST",
						data : {"boardId" :boardId},
						success : function(){
							likeBlistArr.push(boardId);
						},
						error : function(){
							alert("에러입니다.");
						}
						});
				}
					};
	$(".like").click(function (){
        var currentImagePath = $("#btn"+index).find("img.board_like").attr("src");
        var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
            path+"/images/board/red_heart.png" :
            path+"/images/board/heart.png";
        $("#btn"+index).find("img.board_like").attr("src", newImagePath);
    });
	


function show(jsondata) {
	//console.log(totalList);
	//var output = "";
    $.each(jsondata, function (index, item) {
    	console.log('돌아라');
        // 날짜 포맷팅
        var str = item.finishTime.substr(2, 2) + "년 " + item.finishTime.substr(5, 2) + "월 " + item.finishTime.substr(8, 2) + "일 " +
            item.finishTime.substr(11, 2) + "시 " + item.finishTime.substr(14, 2) + "분";
        
        // 가격 계산
        //var perprice = (item.price / item.pCount) - ((item.price / item.pCount) % 10);
        var perprice = Math.round(item.price/item.pCount);

        // 거래 실패 여부 확인
        var dealfail = false;
        if (failId_array.includes(item.boardId)) {
            dealfail = true;
        }
        
        //거래 성공 여부 확인
        var dealsuccess = false;
        if (successId_array.includes(item.boardId)) {
        	dealsuccess = true;
        }
    
        // HTML 생성
        if(dealfail){
        	output+=`<div id="list" class="donecss">`
        } else if(dealsuccess){
        	output+=`<div id="list" class="successcss">`
        } else{
        	output+= `<div id="list">`
        }
        output +=  ` 
        <div class="pro_info">
        	<ul>
				<li><img class="pro_img" src="\${item.imagePath}"></li>
			</ul>
			<div class="pro_name">
				<ul>
					<li>\${item.brand}</li>
					<li>\${item.pName}</li>
				</ul>
			</div>
			<div class="pro_detail">
				<ul>
					<li><img class="user" src="${path}/images/board/box.png">
						<span> \${item.pCount - item.totalpickCount} 개 남음 </span></li>
					<li><img class="card" src="${path}/images/board/card.png">
						<span>\${perprice}원 </span> <span style="color: gray;">(개당)</span></li>
					<li><img class="clock" src="${path}/images/board/clock.png">
						<span>\${str} 까지 </span></li>
				</ul>
			</div>
			<ul>
				<li class="detail_view">
					<button class="like" id="btn\${index}" type="button" value="\${item.boardId}" onclick="handleLikeButtonClick(\${index}, \'\${item.boardId}\')">
					  \${likeBlistArr.includes(item.boardId) ? 
					    `<img class="board_like" id="board_like" src="${path}/images/board/red_heart.png">` : 
					    `<img class="board_like" id="board_like" src="${path}/images/board/heart.png">`
					  }
					</button>`
					if(dealfail){
						output+=`<button id="fast_detail_btn" class="detail_btn" disabled="disabled">보기</button>`
					}else if(dealsuccess){
						output+=`<button id="fast_detail_btn" class="detail_btn" disabled="disabled">보기</button>`
					}
					else{
					output += `<button id="fast_detail_btn" class="detail_btn" value="\${item.boardId}" onclick="f_btn('\${item.boardId}')" >보기</button>`
					}
					
					output += `</li>
			</ul>
           </div>
        </div>`;
    });
  
    // 결과를 HTML에 삽입
    //console.log(output);
    $("#allList").html(output);
}

function filterType() {
    // 필터링 타입 설정
    type_of_filter = document.querySelector(".filter").value;
    info_json = JSON.parse('${infoFb}');
    showList();
}

function showList() {
    output = "";

    if (type_of_filter == 'imminent') { // 임박순
    	info_json.sort(
            function (a, b) {
                return new Date(a.finishTime) - new Date(b.finishTime);
            }
        );
   		console.log(info_json);
        each();
    } else { // 최신순 (default)
    	info_json.sort(
            function (a, b) {
                return new Date(b.uploadTime) - new Date(a.uploadTime);
            }
        );console.log(info_json);
        each();
    }
}

function each() {
    // 실패 정보 파싱 및 배열 생성
    var fail_info = '${fail}';
    var fail_info_array = JSON.parse(fail_info);
    var failId_array = [];

    for (var i = 0; i < fail_info_array.length; i++) {
        var failId = fail_info_array[i].boardId;
        failId_array.push(failId);
    }

    // 리스트 표시
    loadMore();
}

function f_btn(boardId) {
    // 상세 정보 가져오기
    
    $.ajax({
        type: "post",
        url: "/board/fastboardDetail.do",
        data: { boardId: boardId },
        success: function (response) {
            $("#modal").html(response);
            $("#detail_modal_wrap").css("display", "flex");
            esc_btn();
        },
        error: function (error) {
            alert("해당 글은 더 이상 존재하지 않습니다.");
        }
    });
}



// 검색 관련 함수
var keyword ;

function searchBoard() {
    var search = document.querySelector("#search");
    console.log("여기는 search: "+search);
    //console.log("searchBoard의 output"+output);
    search.addEventListener("keydown", function (event) {
        if (event.keyCode === 13) {
        	output = "";
        	keyword = $("#search").val().toLowerCase();
            filterKeyword(info_json, keyword);
        }
    });
}

function check() {
	output = "";
    filterKeyword(info_json, keyword);
}

// 키워드로 필터링
function filterKeyword(info_json, keyword) {
    initNum = 0;
    keyword = $("#search").val();
    result=[];
    $.each(info_json, function (index, item) {
        var product = item.pName;
        var brand = item.brand;
        if (product.includes(keyword) || brand.includes(keyword)) {
            result.push(item);
        }
    });

    // 결과 표시
    loadMore();
    console.log(result);
}

</script>


</body>
</html>

