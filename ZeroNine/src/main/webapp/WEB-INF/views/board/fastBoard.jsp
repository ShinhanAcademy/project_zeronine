<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>

<style>
.donecss{
	border: 1px solid black;
	border-radius: 15px;
	width: 418px;
	margin: 10px 27px 30px 10px;
	display: flex;
	justify-content: flex-start;
	flex-wrap: nowrap;
	align-content: center;
	flex-direction: column;
	align-items: center;
	background-color: rgb(0,0,0,0.5);
	color : white;
	font-family: Jua;
}
</style>

<title>FastBoard</title>
<link rel="stylesheet" href="${path}/css/board/boardList.css" />
<script src="../js/like.js"></script>

</head>
<body>

	<div class="banner zn_center">
		<div style="width: 1440px">
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
				<div id=email data-email="{email}" hidden="hidden"> ${email}</div> 
				
				<div class="edit">
					<span> <img class="edit_img"
						src="${path}/images/board/edit.png">
					</span> <span class="edit_btn"> <a style="font-size: 25px;"
						<%-- href="${path}/board/boardedit.do?boardType=fastBoard" --%>
						data-value="fastBoard" onclick="writeBoard()">글쓰기</a>
					</span>
				</div>
			</div>
		</div>
		<div class="List">
			<div id="allList"></div>
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
			location.href="${path}/board/boardedit.do?boardType=fastBoard";
			/* location.href="${path}/auth/login.do"; */
		} else{
			location.href="${path}/board/boardedit.do?boardType=fastBoard";
		}
	}
	
	
	</script>
	

	<script>
	
	var type_of_filter;
	var infoFb_json;
	var output ="";
	$(filterType)
	
	
	
	function filterType() {
	    type_of_filter = document.querySelector(".filter").value;
	    console.log(type_of_filter);
	    infoFb_json = JSON.parse('${infoFb}');
	    console.log(infoFb_json); 
	    showList();
	}

	    function showList() {
	        var type_of_filter = document.querySelector(".filter").value;
	        output = "";
	  
	        if (type_of_filter == 'imminent') {//임박순
	        	console.log(infoFb_json);
	        	infoFb_json.sort(
	                function (a, b) {
	                    return new Date(a.finishTime) - new Date(b.finishTime);
	                }
	            )
	            each();     
	        } else { //최신순 (default)
	        	infoFb_json.sort(
	                function (a, b) {
	                    return new Date(b.uploadTime) - new Date(a.uploadTime)
	                }
	            )
	            each();
	    }
	    }
	    
	    function each(){
	    	var fail_info = '${fail}';
	    	var fail_info_array = JSON.parse(fail_info);
	    	var failId_array = [];
	    	for(var i =0 ; i<fail_info_array.length ; i ++){
	    	var failId = fail_info_array[i].boardId;
	    		failId_array.push(failId)
	    		
	    		}
	    	console.log(failId_array);
	    		
	    	
	    	
	    	
	    	
	    	 $.each(infoFb_json, function (index, item) {
		            var str = item.finishTime.substr(2, 2)+"년 "+item.finishTime.substr(5, 2)+"월 "+item.finishTime.substr(8, 2)+"일 "+
		            			item.finishTime.substr(11, 2)+"시 "+item.finishTime.substr(14, 2)+"분";
		            var perprice = (item.price / item.pCount)-((item.price / item.pCount)%10);
		            console.log(item.boardId) //잘 나옴
		            console.log(fail_info.boardId) //안나옴 -> 원인 찾아야
		            var failId = false;
		            if(item.boardId == fail_info.boardId){
		            	failId = true;
		            }
		                   output += `
		                	   <div id="list" \${failId ? "class=donecss" : ""}>
		   					<div class="pro_info">
		   						<ul>
		   							<li><img class="pro_img"
		   								src="\${item.imagePath}"></li>
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
		   									<span> \${item.pCount - item.totalpickCount} 남음 </span></li>
		   								<li><img class="card" src="${path}/images/board/card.png">
		   									<span>\${perprice}원 </span> <span style="color: gray;">(개당)</span></li>
		   								<li><img class="clock" src="${path}/images/board/clock.png">
		   									<span>\${str} 까지 </span></li>
		   							</ul>
		   						</div>
		   						<ul>
		   							<li class="detail_view">
		   								<button class="like" type="button">
		   									<img class="like" src="${path}/images/board/heart.png">
		   								</button>
		   								<button id="fast_detail_btn" class="detail_btn" value="\${item.boardId}" >보기</button>
		   							</li>
		   						</ul>
		   					</div>

		   				</div>
		                    `;
	        });
	          $("#allList").html(output);
	          $(".detail_btn").on("click",
	        		  function f_btn(){
	        		  	var board_id = $(this).val();
	        		  	console.log(board_id);
	        		  	
	        		  	
	        		  	$.ajax({
	        		  		type : "post",
	        		  		url : "/board/fastboardDetail.do",
	        		  		data: {boardId : board_id},
	        		  		success: function(response){
	        		  	
	        		  			$("#modal").html(response);
	        		  			$("#detail_modal_wrap").css("display","flex");
	        		  			esc_btn();
	        		  			
	        		  		},
	        		  		error: function(error) {
	        		  		alert("해당 글은 더 이상 존재하지 않습니다.");
	        		  		}
	        		  	});
	        		  });
	    }
	</script>

	<script type="text/javascript">
	$(searchBoard)
	$(check)
	
	var keyword = $("#search").val();

	function searchBoard(){
		var search = document.querySelector("#search");
		search.addEventListener("keydown", function(event){
			if(event.keyCode === 13){
				alert($("#search").val());
				filterKeyword(infoFb_json, keyword);
				
				
			}
		})
	}
	
	function check(){
		filterKeyword(infoFb_json, keyword);
	}
	

	var infoFb_json = JSON.parse('${infoFb}');
	function filterKeyword(infoFb_json, keyword) {
	    var result = [];
	    var result_output = "";
	    keyword = $("#search").val();
	    $.each(infoFb_json, function (index, item) {
	        var product = item.pName;
	        var brand = item.brand;
	        if (product.includes(keyword) || brand.includes(keyword)) {
	            result.push(item);
	        }
	    })

	    $.each(result, function (index, resultP) {
	        var str = resultP.finishTime.substr(2, 2) + "년 " + resultP.finishTime.substr(5, 2) + "월 " + resultP.finishTime.substr(8, 2) + "일 " +
	        resultP.finishTime.substr(11, 2) + "시 " + resultP.finishTime.substr(14, 2) + "분";
	        var perprice = (resultP.price / resultP.pCount) - ((resultP.price / resultP.pCount) % 10);
	        result_output += `
				<div id="list">
					<div class="pro_info">
						<ul>
							<li><img class="pro_img" src="\${resultP.imagePath}"></li>
						</ul>
						<div class="pro_name">
							<ul>
								<li>\${resultP.brand}</li>
								<li>\${resultP.pName}</li>
							</ul>
						</div>
						<div class="pro_detail">
							<ul>
								<li><img class="user" src="${path}/images/board/box.png">
									<span> \${resultP.pCount - resultP.totalpickCount} 남음 </span></li>
								<li><img class="card" src="${path}/images/board/card.png">
									<span>\${perprice}원 </span> <span style="color: gray;">(개당)</span></li>
								<li><img class="clock" src="${path}/images/board/clock.png">
									<span>\${str} 까지 </span></li>
							</ul>
						</div>
						<ul>
							<li class="detail_view">
								<button class="like" type="button">
									<img class="like" src="${path}/images/board/heart.png">
								</button>
								<button id="fast_detail_btn" class="detail_btn" value="\${resultP.boardId}" >보기</button>
							</li>
						</ul>
					</div>
				</div>`;
	    });

	    $("#allList").html(result_output);

	    console.log(result);
	}
	
	</script>
	
	

</body>
</html>

