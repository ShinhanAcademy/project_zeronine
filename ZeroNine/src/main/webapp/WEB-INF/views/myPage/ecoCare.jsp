<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/ecocare.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<script defer src="/js/myPage/ecoCare.js"></script>
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<!-- zero_container -->
	<div class="zero_container zn_center">
		<!-- mypage_container -->
		<div class="mypage_container">
			<!-- zero_sbn -->
			<%@include file="common/myPageSnb.jsp"%>
			<!-- //zero_sbn -->
			<!-- mypage_detail_wrap -->
			<div class="mypage_detail_wrap">
				<!-- my_info_wrap -->
				<%@include file="common/mylInfo.jsp"%>
				<!-- //my_info_wrap -->
				<!-- contents_wrap -->



				<div id="myeco_wrap" class="contents_wrap">
					<span class="con_tit">나의 에코케어 </span> <span
						style="font-size: 15px; color: #999;"> (최근 3개월 기준) </span>
					<%-- dashboard_wrap --%>
					<div class="contents dashboard_wrap">
						<div class="tbl_wrap">
							<table class="tbl_chat_wrap" >
								<colgroup>
									<col width="45%" />
									<col span="2" />
								</colgroup>

								<tbody class="dashboard_th">
								<tr>
										<td>
											<div> 에코케어 현황	</div>
										</td>
										<td>
										<div> 배출 쓰레기 비율 </div>
										</td>
										<td>
										<div class = "eco_level">
											<span> 지금까지 총 </span>
											<span class="num">   </span>
											<span> 자연을 살렸습니다.</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="bCanvas">
												<canvas id="myBarChart"></canvas>
											</div>
										</td>
										<td>
										<div class="dCanvas">
												<canvas id="myDoughnutChart"></canvas>
										</div>
										</td>
										<td class ="img">
											<%-- <img src="${path}/images/mypage/ecoLevel/lev3.gif"> --%>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<%-- //dashboard_wrap --%>



					<div class="con_tit">회수 신청</div>
					<%-- pickup_request_wrap --%>
					
					<div class="contents pickup_request_wrap">
						<div class="tbl_wrap">
							<table class="tbl_pickup_request_wrap">
								<colgroup>
									<col width="6%" />
									<col width="40%" />
									<col width="12%" />
									<col span="2" />
								</colgroup>
								<thead>
									<tr>
										<th>
											<input type="checkbox">
										</th>
										<th>보유 쿠폰</th>
										<th>잔여 회수</th>
										<th>회수 예정일</th>
										<th>신청</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<input type="checkbox">
										</td>
										<td class="pCoupon_info">
											<div class="title">에코케어</div>
											<div class="mid_title">쓰레기 회수 이용권</div>
											<div class="ann">* 음식물 쓰레기 10회 + 일반 쓰레기 10회 (총 20회)</div>
										</td>
										<td>
											3회
										</td>
										<td>
											<div class="pickup_date"> 23년 12월 22일 20시 </div>
										</td>
										<td>
											<button class="btn_blue">신청하기</button>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox">
										</td>
										<td class="pCoupon_info">
											<div class="title">5회 이용권</div>
											<div class="mid_title">쓰레기 회수 이용권</div>
											<div class="ann">* 음식물 쓰레기 5회 또는 일반 쓰레기 5회 (총 5회)</div>
										</td>
										<td>
											3회
										</td>
										<td>
											<div class="pickup_date"> 23년 12월 22일 20시 </div>
										</td>
										<td>
											<button class="btn_blue">신청하기</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<%-- //pickup_request_wrap --%>
					<div class="con_tit">회수 내역</div>
					<%-- pickup_history_wrap --%>
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
								총 <span>2</span>건
							</div>
						</div>
						<div class="tbl_wrap">
							<table class="tbl_chat_wrap">
								<colgroup>
									<col width="66%" />
									<col span="2" />
								</colgroup>
								<thead>
									<tr>
										<th>과거 회수 내역</th>
										<th>승인 여부</th>
										<th>회수 처리 결과</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>일반쓰레기 수거 요청건</td>
										<td>완료</td>
										<td>
											<button class="btn_blue">상세 보기</button>
										</td>
									</tr>
									<tr>
										<td>일반쓰레기 수거 요청건</td>
										<td>완료</td>
										<td>
											<button class="btn_blue">상세 보기</button>
										</td>
									</tr>
									<tr>
										<td>일반쓰레기 수거 요청건</td>
										<td>완료</td>
										<td>
											<button class="btn_blue">상세 보기</button>
										</td>
									</tr>
									<tr>
										<td>일반쓰레기 수거 요청건</td>
										<td>완료</td>
										<td>
											<button class="btn_blue">상세 보기</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- pagination -->
						<%-- <c:if test="${booklist.size() != 0}"> --%>
						<div class=pagination>
							<div class="pageLeft">
								<button class="btnFirst">첫페이지</button>
								<button class="btnPrev">이전페이지</button>
							</div>
							<ul class="pagingWrap">
								<li><a href="">1</a></li>
								<li><a href="">2</a></li>
								<li><a href="">3</a></li>
								<li><a href="">4</a></li>
								<li><a href="">5</a></li>
								<li><a href="">6</a></li>
								<li><a href="">7</a></li>
								<li><a href="">8</a></li>
								<li><a href="">9</a></li>
								<li><a href="">10</a></li>
							</ul>
							<div class="pageRight">
								<button class="btnNext">다음페이지</button>
								<button class="btnLast">마지막페이지</button>
							</div>
						</div>
						<%-- </c:if> --%>
						<!-- //pagination -->
					</div>
					<%-- //pickup_history_wrap --%>
				</div>
				<!-- //contents_wrap -->
			</div>
			<!-- //mypage_detail_wrap -->
		</div>
		<!-- //mypage_container -->
	</div>
	<!-- //zero_container -->
	<%@include file="../common/footer.jsp"%>

</body>

<script type="text/javascript">

//currentMonth로 월만 추출 후 map저장
var ecodashinfo_arr = [];
var dash_arr = JSON.parse('${ecodashinfo}');
console.log(dash_arr);
for(var i=0 ; i<dash_arr.length; i++){
	var map = dash_arr[i];
	var str = dash_arr[i].pickUpRequestTime;
	var month = str.substring(5,7);
	map.currentMonth = month;
	ecodashinfo_arr.push(map);
}

//월별 count
var current_month = new Date().getMonth()+1;
var month_1 = current_month-2;
var month_2 = current_month-1;
var month_3 = current_month;
console.log(month_1, month_2, month_3);

var ctn_month = [0,0,0];

for(var i=0; i<ecodashinfo_arr.length; i++){
	var month = ecodashinfo_arr[i].currentMonth;
	if(month == month_1){
		ctn_month[0] ++;	
	} else if(month == month_2){
		ctn_month[1] ++;
	} else if(month == month_3){
		ctn_month[2] ++;
	}
}
console.log(ctn_month);
var month_2ctn = ctn_month[2];
console.log(month_2ctn);

//화면 구성
document.querySelector(".num").innerText = month_2ctn+"회";

if(month_2ctn<=5){
	document.querySelector(".img").innerHTML = '<img src="${path}/images/mypage/myEco/lev1.gif">';
}else if(month_2ctn<=9){
	document.querySelector(".img").innerHTML = '<img src="${path}/images/mypage/myEco/lev2.gif">';
} else {
	document.querySelector(".img").innerHTML = '<img src="${path}/images/mypage/myEco/lev3.gif">';
}

//배출 쓰레기 유형
var waste_arr = [0,0];
for(var i =0; i<ecodashinfo_arr.length; i++){
	var waste = ecodashinfo_arr[i].isFoodWaste;
	if(waste == "true" ){
		waste_arr[0] ++;
	} else{
		waste_arr[1] ++;
	}
} 
console.log(waste_arr);

//lable display




//바 차트
	var now = new Date();
	var label_1 = now.getMonth() - 1;
	var label_2 = now.getMonth();
	var label_3 = now.getMonth() + 1;
	var ctx1 = document.getElementById("myBarChart");
	
	var myBarChart = new Chart(ctx1, {
		type : "bar",
		data : {
			labels : [ label_1+ "월", label_2+ "월", label_3+ "월" ],
			datasets : [ {
				data : ctn_month,
				borderColor : function(context) {
					var index = context.dataIndex;
					var value = context.dataset.data[index];
					return value <= 5 ? "rgba(255, 206, 86, 1)"
							: value <= 9 ? "rgba(75, 192, 192, 1)"
									: "rgba(54, 162, 235, 1)";
				},
				borderWidth : 1,
				backgroundColor : function(context) {
					var index = context.dataIndex;
					var value = context.dataset.data[index];
					return value <= 5 ? "rgba(255, 206, 86, 0.2)"
							: value <= 9 ? "rgba(75, 192, 192, 0.2)"
									: "rgba(54, 162, 235, 0.2)";
				},
			} ]
		},
		plugins: [ChartDataLabels],
		options : {
			responsive : true,
			scales : {
				x : {
					grid : {
						display : false,
					}
				},
				y : {
					type : 'linear',
					grace : '10%',
					grid : {
						color : function(context) {
							if (context.tick.value === 0) {
								return '#EAEAEA';
							}
						}
					}
				}
			},
			plugins : {
				legend : false,
				datalabels: {
		            display:  function(context){
		            	var index = context.dataIndex;
						var value = context.dataset.data[index];
						return value==0? false : true;
		            },
		            align: 'bottom',
		            anchor: 'end',
		            clamp: true,
		            color: function (ctx1) {
		                const value = ctx1.dataset.data[ctx1.dataIndex];
		                return '#000000';
		            },
		            formatter: function (value, context) {
		                return context.dataset.data[context.dataIndex] + "건";
		            }
		        },
		        tooltip :{
		        	enabled :false
		        }
			}
		}
	});
	

//파이 차트
var ctx2 = document.getElementById("myDoughnutChart");	
var myDoughnutChart = new Chart(ctx2, {
    type: 'pie',
  	data : {
		labels : [ "일반", "음식물"],
		datasets : [{
			data : waste_arr,
			labels : [ "일반", "음식물"],
			backgroundColor : ["rgba(153, 102, 255, 0.3)","rgba(54, 162, 235, 0.3)"],
			borderWidth : 3
		}
		]
  	},
  	plugins: [ChartDataLabels],
	options : {
		responsive : true,
		plugins : {
			datalabels: {
	            display: true,
	            align: 'center',
	            anchor: 'center',
	            clamp: true,
	            display: true,
	            color: function (ctx) {
	                const value = ctx.dataset.data[ctx.dataIndex];
	                return '#000000';
	            },
	            formatter: function (value, context) {
                    return context.dataset.data[context.dataIndex] + "건";
	            }
	        },
	        tooltip :{
	        	enabled :false
	        }
		}
	}
});



</script>