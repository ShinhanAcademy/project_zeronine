<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<!-- swiper -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- chart -->
<script src="${path}/js/jslib/chart.js"></script>

<link href="${path}/css/main/main.css" rel="stylesheet" />
<link href="${path}/css/detailView.css" rel="stylesheet" />
<script defer src="${path}/js/main/main.js"></script>
<script defer src="${path}/js/detailView.js"></script>
<title>ZeroNine</title>
</head>
<body>
    <div id="zeronine_wrap">  
		<%@include file="../common/header.jsp" %>
		<div id="zn_container" class="zero_container main_container">
		    <section class="main_visual_wrap">
		        <div class="inner zn_center">
			    	<div class="visual_slide_wrap">
				        <ul class="swiper-wrapper visual_list">
						    <li class="swiper-slide">
						    	<a href="${path}/main/introZeroNine.do">
									<img src="${path}/images/main/mainvisual_01.png" alt="main visual">
								</a>
						    </li>
						    <li class="swiper-slide">
						    	<a href="${path}/main/introZeroNine.do">
									<img src="${path}/images/main/mainvisual_02.png" alt="main visual">
								</a>
						    </li>
						    <li class="swiper-slide">
						    	<a href="${path}/main/introZeroNine.do">
									<img src="${path}/images/main/mainvisual_03.png" alt="main visual">
								</a>
						    </li>
						    <li class="swiper-slide">
						    	<a href="${path}/main/introZeroNine.do">
									<img src="${path}/images/main/mainvisual_04.png" alt="main visual">
								</a>
						    </li>
						    <li class="swiper-slide">
						    	<a href="${path}/main/introZeroNine.do">
									<img src="${path}/images/main/mainvisual_05.png" alt="main visual">
								</a>
						    </li>
						</ul>
						
						<!-- If we need pagination -->
						<div class="swiper-pagination"></div>
						
						<!-- If we need navigation buttons -->
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
			    	</div>
		        </div>
		    </section>
		    <section class="intro_wrap">
		        <div class="title">똑똑한 소비의 3가지 방법</div>
		        <div class="smart_shopping">
		            <div class="intro_unit" data-name="fast">
		                <div class="img_wrap">
		                    <img src="${path}/images/main/img_rocket.png" alt="3ways_image">
		                </div>
		                <div class="sub_tit">슝슝 즉배</div>
		                <p>필요 없는 1+1 상품을 나눠서 구매해요!</p>
		            </div>
		            <div class="intro_unit" data-name="free">
		                <div class="img_wrap">
		                    <img src="${path}/images/main/img_dollar.png" alt="3ways_image">
		                </div>
		                <div class="sub_tit">알뜰 무배</div>
		                <p>같이 구매하고 무료 배송 받아요!</p>
		            </div>
		            <div class="intro_unit" data-name="one">
		                <div class="img_wrap">
		                    <img src="${path}/images/main/img_chat.png" alt="3ways_image">
		                </div>
		                <div class="sub_tit">1:1 직거래</div>
		                <p>가까운 곳에 있는 이웃과<br>직접 만나 함께 구매해요!</p>
		            </div>
		        </div>
		    </section>
		    <section class="board_wrap">
		        <div class="board_unit fast_delivery">
		            <div class="title">슝슝 즉배</div>
		            <div class="fast_list_wrap list_wrapper">
			            <ul class="swiper-wrapper card_list fast_list">
			            </ul>
		            </div>
		        </div>
		        <div class="board_unit free_delivery">
		            <div class="title">알뜰 무배</div>
		            <div class="free_list_wrap list_wrapper">
			            <ul class="swiper-wrapper card_list free_list">
			            </ul>
		            </div>
		        </div>
		        <div class="board_unit direct_deal">
		            <div class="title">1:1 직거래</div>
		            <div class="direct_list_wrap list_wrapper">
			            <ul class="swiper-wrapper card_list direct_list">
			            </ul>
		            </div>
		        </div>
		    </section>
		    <section class="recommended_wrap">
		        <div class="title">이런 상품은 어때요 ?</div>
		        <div class="recommended_list">
		        	<div class="recommended_list_inner">
			            <!-- <div class="product_wrap swiper-wrapper"> -->
			            <div class="product_wrap">
			            </div>
		        	</div>
		            <div class="view_more">+</div>
		        </div>
		    </section>
		    <section class="sub_visual_wrap">
		        <div class="inner zn_center">
		            <div class="left_con">
		                <div class="img_wrap">
		                    <img src="${path}/images/main/ico_logo.png" alt="logo">
		                </div>
		                <div class="visual_sentence">
		                    <div>환경보호에 진심인</div>
		                    <div>Zero9</div>
		                    <p>지금까지 이루어낸 것들을 알려드릴게요!</p>
		                </div>
		            </div>
		            <ul class="right_con">
		                <li class="service_unit">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/img_people.png" alt="zero_icon">
		                    </div>
		                    <div class="detail">
		                        <div>2,245,341 명</div>
		                        <span>회원수</span>
		                    </div>
		                </li>
		                <li class="service_unit">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/img_hands.png" alt="zero_icon">
		                    </div>
		                    <div class="detail">
		                        <div>46,328 건</div>
		                        <span>공구 성사 건수</span>
		                    </div>
		                </li>
		                <li class="service_unit">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/img_trash.png" alt="zero_icon">
		                    </div>
		                    <div class="detail">
		                        <div>19,738 t</div>
		                        <span>쓰레기 회수량</span>
		                    </div>
		                </li>
		                <li class="service_unit">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/img_recycle.png" alt="zero_icon">
		                    </div>
		                    <div class="detail">
		                        <div>87.7%</div>
		                        <span>재활용 진행률</span>
		                    </div>
		                </li>
		            </ul>
		        </div>
		    </section>
		    <section class="advertisement_wrap zn_center">
		        <div class="img_warp ad_01">
		            <img src="${path}/images/main/img_ad_01.png" alt="advertisement">
		        </div>
		        <div class="img_warp ad_02">
		            <img src="${path}/images/main/img_ad_02.png" alt="advertisement">
		        </div>
		    </section>
		</div>
		<%-- <%@include file="../common/detailView.jsp"%> --%>
		<%@include file="../common/footer.jsp" %>
    </div>
    <div id="modal"></div>
</body>
</html>