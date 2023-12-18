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
	<script>
	
	var type_of_filter;
	var infoOne_json;

	$(filterType)
 $(document).on("click", ".detail_btn", function() {
    function o_btn() {
        var board_id = $(this).val();
        console.log(board_id);

        $.ajax({
            type: "post",
            url: "/board/oneboardDetail.do",
            data: { boardId: board_id },
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
});

	
	function filterType() {
	    type_of_filter = document.querySelector(".filter").value;
	    console.log(type_of_filter);
	    infoOne_json = JSON.parse('${infoOne}');
	    console.log(infoOne_json); 
	    showList();
	}

	    function showList() {
	        var type_of_filter = document.querySelector(".filter").value;
	      
	        if (type_of_filter == 'imminent') {//임박순
	        	console.log(infoOne_json);
	            infoOne_json.sort(
	                function (a, b) {
	                    return new Date(a.finishtime) - new Date(b.finishtime);
	                }
	            )
	            each();
	    
	    
	        } else { //최신순 (default)
	            infoOne_json.sort(
	                function (a, b) {
	                    return new Date(b.oUploadTime) - new Date(a.oUploadTime)
	                }
	            )
	           each();
	    }
	    }
	    function each(){
	    	var output="";
	    	$.each(infoOne_json, function (index, item) {
	            var str = item.finishtime.substr(2, 2)+"년 "+item.finishtime.substr(5, 2)+"월 "+item.finishtime.substr(8, 2)+"일 "+
	            			item.finishtime.substr(11, 2)+"시 "+item.finishtime.substr(14, 2)+"분";
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
	                                        <span> \${str}까지</span></li>
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
	    
	   
        		
	</script>

	<script type="text/javascript">
	
	$(searchBoard)
	$(check)
	
	var search;
	
	function searchBoard(){
		search = document.querySelector("#search");
		var keyword = $("#search").val();
		search.addEventListener("keydown", function(event){
			if(event.keyCode == 13){
				//console.log($(search).val())
				filterKeyword(infoOne_json,keyword);
			}
		})
		
	}
	
	function check(){
		var keyword = $("#search").val();
		filterKeyword(infoOne_json,keyword);
	}
	
	var infoOne_json = JSON.parse('${infoOne}');
	function filterKeyword(infoOne_json,keyword){
		var result =[];
		var result_output ="";
		keyword = $("#search").val().toLowerCase();
		$.each(infoOne_json,function(index, item){
			var title = item.oTitle.toLowerCase();
			var address = item.address.toLowerCase() +" "+ item.addressDetail.toLowerCase();
			if(title.includes(keyword) || address.includes(keyword)){
				result.push(item);
			}
		})
		 console.log(result)
	
	
	$.each(result, function (index, resultO){
		 var str = resultO.finishTime.substr(2, 2) + "년 " + resultO.finishTime.substr(5, 2) + "월 " + resultO.finishTime.substr(8, 2) + "일 " +
		 resultO.finishTime.substr(11, 2) + "시 " + resultO.finishTime.substr(14, 2) + "분";
		 result_output += `
             <div id="list">
             <div class="pro_info">
                 <ul>
                     <li><img class="pro_img" src="\${resultO.oBoardImagePath}"></li>
                 </ul>


                 <div class="pro_name">
                     <ul>
                         <li>\${resultO.oTitle}</li>
                     </ul>
                 </div>
                 <div class="pro_detail">
                     <ul>
                         <li><img class="clock" src="${path}/images/board/clock.png">
                             <span> \${str}까지</span></li>
                         <li><img class="map_marker"
                             src="${path}/images/board/map_marker.png"> <span>
                                 \${resultO.address} \${resultO.addressDetail} </span></li>
                     </ul>
                 </div>
                 <ul>
                     <li class="detail_view">
                         <button class="like" type="button">
                             <img class="like" src="${path}/images/board/heart.png">
                         </button>
                         <button id="one_detail_btn" class="detail_btn"
                             value="\${resultO.oBoardId}">보기</button>
                     </li>
                 </ul>
             </div>

         </div>
         `;
});


$("#allList").html(result_output);

$(".detail_btn").on("click",
		function o_btn(){
			var board_id = $(this).val();
			console.log(board_id);

			$.ajax({
				type : "post",
				url : "/board/oneboardDetail.do",
				data: {boardId : board_id},
				success: function(response){
				
				console.log(response);
					$("#modal").html(response);
					$("#detail_modal_wrap").css("display","flex");
					esc_btn();
				},
				error: function(error) {
				alert("해당 글은 더 이상 존재하지 않습니다.");
				}
			});
		});
$("#allList").html(result_output);
		console.log(result)
	}
	
	</script>

</body>
</html>

