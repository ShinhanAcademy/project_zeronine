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
							<table class="tbl_chat_wrap">
								<colgroup>
									<col width="45%" />
									<col span="2" />
								</colgroup>

								<tbody class="dashboard_th">
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
										<td>
											<div>~~ 구독권 추천 ~~</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<%-- //dashboard_wrap --%>



					<div class="con_tit">회수 신청</div>
					<%-- pickup_request_wrap --%>
					<div class="contents pickup_request_wrap"></div>
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

	var now = new Date();
	var label_1 = now.getMonth() - 1 + "월";
	var label_2 = now.getMonth() + "월";
	var label_3 = now.getMonth() + 1 + "월";
	var ctx1 = document.getElementById("myBarChart");
	
	var myBarChart = new Chart(ctx1, {
		type : "bar",
		data : {
			labels : [ label_1, label_2, label_3 ],
			datasets : [ {
				data : [ 3, 19, 8 ],
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
		            display: true,
		            align: 'bottom',
		            anchor: 'end',
		            clamp: true,
		            display: true,
		            color: function (ctx) {
		                const value = ctx.dataset.data[ctx.dataIndex];
		                return '#000000';
		            },
		            formatter: function (value, context) {
		                return context.dataset.data[context.dataIndex] + "건";
		            }
		        }
			}
		}
	});
	

var ctx2 = document.getElementById("myDoughnutChart");	
var myDoughnutChart = new Chart(ctx2, {
    type: 'pie',
  	data : {
		labels : [ "일반", "음식물"],
		datasets : [{
			data : [3, 17],
			labels : [ "일반", "음식물"],
			//borderColor : ["rgba(75, 192, 192, 1)", "rgba(54, 162, 235, 1)"],
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
	        }
		}
	}
});






</script>