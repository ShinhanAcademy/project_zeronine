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
<script src="../js/board/loadMore.js"></script>
</head>


<body>
	<div class="banner zn_center">

		<div style="width: 1440px; padding: 20px 0px;">
			<img src="${path}/images/board/banner3.png">
		</div>

		<div class="search">
			<ul>
				<li>
					<div class="search_area">
						<input type="text" name="q" placeholder="상품명, 제조사 검색" id="search"
							onchange="searchBoard()">
						<button type="submit" onclick="check()"></button>
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
						data-value="oneTooneBoard" onclick="writeBoard()">글쓰기</a>
					</span>
				</div>
			</div>
		</div>
		<div id="allList"></div>
		<div id="load_more_btn_wrap">
			<button id="loadMore_btn" onclick="loadMore()"> 
			<img src="${path}/images/board/loadmore.png">
			</button>
			</div>
		<div id="modal"></div>
	</div>


	<%@include file="../common/footer.jsp"%>
	<script src="../js/detailView.js"></script>
	<script>
	function writeBoard(){
		var id = '${email}';
		if(id==""){
			alert("로그인 후 작성 가능합니다.");
			location.href="${path}/auth/login.do";
		} else{
			location.href="${path}/board/boardedit.do?boardType=oneTooneBoard";
		}
	}
	</script>
	<script src="../js/detailView.js"></script>
	

<script>
var type_of_filter;
var info_json;
var output = "";

// DOM이 준비되면 필터링 함수 호출
$(filterType);
$(searchBoard);

function show(jsondata) {
	console.log(jsondata.length);
	//output = "";
    $.each(jsondata, function (index, item) {
        // 날짜 포맷팅
       var str = item.finishtime.substr(2, 2)+"년 "+item.finishtime.substr(5, 2)+"월 "+item.finishtime.substr(8, 2)+"일 "+
	            			item.finishtime.substr(11, 2)+"시 "+item.finishtime.substr(14, 2)+"분";

        /* // 거래 실패 여부 확인
        var dealfail = false;
        if (failId_array.includes(item.boardId)) {
            dealfail = true;
        } */
        
        //거래 성공 여부 확인
        var dealsuccess = false;
        if (item.isDealFinish == "true") {
        	dealsuccess = true;
        }
        console.log("완료 여부 확인 " +dealsuccess)

        // HTML 생성
        if(dealsuccess){
        	console.log("여기 true로 찍히는지 확인")
        	output+=`<div id="list" class="successcss">`
        } else{
        	output+= `<div id="list">`
        }
        output +=  ` 
        <div class="pro_info">
        
			<ul>
				<li><img class="pro_img"
					src="\${item.oBoardImagePath}"></li>
			</ul>
			 <div class="pro_name">
            <ul>
                <li>\${item.oTitle}</li>
            </ul>
        </div>
        <div class="pro_detail">
            <ul>
                <li><img class="clock" src="${path}/images/board/clock.png">
                    <span> \${str}까지</span></li>
                <li><img class="map_marker"
                    src="${path}/images/board/map_marker.png"> <span>
                        \${item.address} \${item.addressDetail} </span></li>
            </ul>
        </div>
        <ul>
            <li class="detail_view">
                    <button id="one_detail_btn" class="detail_btn" value="\${item.oBoardId}" onclick="o_btn('\${item.oBoardId}')" >보기</button>
					</li>
        </ul>
    </div>

</div>
`;
});


    // 결과를 HTML에 삽입
    //console.log(output);
    $("#allList").html(output);
}

function filterType() {
    // 필터링 타입 설정
    type_of_filter = document.querySelector(".filter").value;
    info_json = JSON.parse('${infoOne}');
    console.log("필터 타입~~"+type_of_filter)
    showList();
}

function showList() {
    output = "";
    result = [];
    initNum = 0;
    if (type_of_filter == 'imminent') { // 임박순
    	info_json.sort(
            function (a, b) {
                return new Date(a.finishTime) - new Date(b.finishTime);
            } 
        );console.log(info_json);
    } else if (type_of_filter == 'recent'){ // 최신순 (default)
    	info_json.sort(
            function (a, b) {
                return new Date(b.oUploadTime) - new Date(a.oUploadTime);
            }
        );console.log(info_json);
    }
    each();
}


function o_btn(boardId) {
    
    $.ajax({
        type: "post",
        url: "/board/oneboardDetail.do",
        data: { boardId: boardId },
        success: function(response) {
            console.log(response);
            $("#modal").html(response);
            $("#detail_modal_wrap").css("display", "flex");
            esc_btn();
        },
        error: function(error) {
            alert("The article no longer exists.");
        }
    });
}

// 검색 관련 함수
var keyword ;

function searchBoard() {
    var search = document.querySelector("#search");
    console.log("여기는 search: "+search);
   
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
        var title = item.oTitle.toLowerCase();
        var fullAddress = item.address.toLowerCase() + " " + item.addressDetail.toLowerCase();
        if (title.includes(keyword) || fullAddress.includes(keyword)) {
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

