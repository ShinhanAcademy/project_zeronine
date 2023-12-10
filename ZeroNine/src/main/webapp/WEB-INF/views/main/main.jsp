<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<script src="${path}/js/jslib/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/main.css">
<title>ZeroNine</title>
</head>
<body>
    <div id="zeronine_wrap">  
		<%@include file="../common/header.jsp" %>
		<div id="zn_container" class="zero_container main_container">
		    <section class="main_visual_wrap">
		        <div class="inner zn_center">
			        <ul class="bxslider">
					    <li>
							<img src="${path}/images/main/mainvisual_01.png" alt="main visual">
					    </li>
					    <li>
							<img src="${path}/images/main/mainvisual_02.png" alt="main visual">
					    </li>
					    <li>
							<img src="${path}/images/main/mainvisual_03.png" alt="main visual">
					    </li>
					    <li>
							<img src="${path}/images/main/mainvisual_04.png" alt="main visual">
					    </li>
					    <li>
							<img src="${path}/images/main/mainvisual_05.png" alt="main visual">
					    </li>
					</ul>
		        </div>
		        
  <script>
  $(document).ready(function(){
	  $('.bxslider').bxSlider({
		    auto: true,
		    autoHover: true,
		    controls: true,
		    speed: 500
	  });
	});
  </script>
		    </section>
		    <section class="intro_wrap">
		        <div class="title">똑똑한 소비의 3가지 방법</div>
		        <div class="smart_shopping">
		            <div class="intro_unit">
		                <div class="img_wrap">
		                    <img src="${path}/images/main/img_rocket.png" alt="3ways_image">
		                </div>
		                <div class="sub_tit">슝슝 즉배</div>
		                <p>필요 없는 1+1 상품을 나눠서 구매해요!</p>
		            </div>
		            <div class="intro_unit">
		                <div class="img_wrap">
		                    <img src="${path}/images/main/img_dollar.png" alt="3ways_image">
		                </div>
		                <div class="sub_tit">알뜰 무배</div>
		                <p>같이 구매하고 무료 배송 받아요!</p>
		            </div>
		            <div class="intro_unit">
		                <div class="img_wrap">
		                    <img src="${path}/images/main/img_chat.png" alt="3ways_image">
		                </div>
		                <div class="sub_tit">1:1 직거래</div>
		                <p>가까운 곳에 있는 이웃과<br>직접 만나 함께 구매해요!</p>
		            </div>
		        </div>
		    </section>
		    <section class="board_wrap">
		        <div class="board_unit immediate_delivery">
		            <div class="title">슝슝 즉배</div>
		            <ul class="card_list">
		                <li>
		                    <div class="tit">스팸 싱글 마일드 2개 나눠요!</div>
		                    <p>CJ제일제당 스팸 싱글 마일드 80g*3</p>
		                    <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                </li>
		                <li>
		                    <div class="tit">스팸 싱글 마일드 2개 나눠요!</div>
		                    <p>CJ제일제당 스팸 싱글 마일드 80g*3</p>
		                    <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                </li>
		                <li>
		                    <div class="tit">스팸 싱글 마일드 2개 나눠요!</div>
		                    <p>CJ제일제당 스팸 싱글 마일드 80g*3</p>
		                    <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                </li>
		            </ul>
		        </div>
		        <div class="board_unit saving_delivery">
		            <div class="title">알뜰 무배</div>
		            <ul class="card_list">
		                <li>
		                    <div class="saving_target">
		                        <div class="tit">스팸 싱글 마일드 2개 나눠요!</div>
		                        <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                    </div>
		                    <div class="progress_status">
		                        <img src="${path}/images/main/img_progress01.png" alt="progress">
		                    </div>
		                </li>
		                <li>
		                    <div class="saving_target">
		                        <div class="tit">스팸 싱글 마일드 2개 나눠요!</div>
		                        <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                    </div>
		                    <div class="progress_status">
		                        <img src="${path}/images/main/img_progress01.png" alt="progress">
		                    </div>
		                </li>
		                <li>
		                    <div class="saving_target">
		                        <div class="tit">스팸 싱글 마일드 2개 나눠요!</div>
		                        <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                    </div>
		                    <div class="progress_status">
		                        <img src="${path}/images/main/img_progress01.png" alt="progress">
		                    </div>
		                </li>
		            </ul>
		        </div>
		        <div class="board_unit direct_deal">
		            <div class="title">1:1 직거래</div>
		            <ul class="card_list">
		                <li>
		                    <div class="img_wrap img_user">
		                        <img src="${path}/images/main/img_user.png" alt="user">
		                    </div>
		                    <div class="tit">소금빵 1+1입니다</div>
		                    <p class="location_info">서울 마포구 월드컵북로 34 서교동 우도빌딩 1층, 호텔 아만티 건너편</p>
		                    <ul class="needed">
		                        <li>파리바게뜨 서교점</li>
		                        <li>소금빵 1+1(마감세일) 5,200원</li>
		                        <li>1명 모집</li>
		                    </ul>
		                    <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                </li>
		                <li>
		                    <div class="img_wrap img_user">
		                        <img src="${path}/images/main/img_user.png" alt="user">
		                    </div>
		                    <div class="tit">소금빵 1+1입니다</div>
		                    <p class="location_info">서울 마포구 월드컵북로 34 서교동 우도빌딩 1층, 호텔 아만티 건너편</p>
		                    <ul class="needed">
		                        <li>파리바게뜨 서교점</li>
		                        <li>소금빵 1+1(마감세일) 5,200원</li>
		                        <li>1명 모집</li>
		                    </ul>
		                    <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                </li>
		                <li>
		                    <div class="img_wrap img_user">
		                        <img src="${path}/images/main/img_user.png" alt="user">
		                    </div>
		                    <div class="tit">소금빵 1+1입니다</div>
		                    <p class="location_info">서울 마포구 월드컵북로 34 서교동 우도빌딩 1층, 호텔 아만티 건너편</p>
		                    <ul class="needed">
		                        <li>파리바게뜨 서교점</li>
		                        <li>소금빵 1+1(마감세일) 5,200원</li>
		                        <li>1명 모집</li>
		                    </ul>
		                    <div class="deadline">D-6 <span>(11/29 23:59까지)</span></div>
		                </li>
		            </ul>
		        </div>
		    </section>
		    <section class="recommended_wrap zn_center">
		        <div class="title">이런 상품은 어때요 ?</div>
		        <div class="recommended_list">
		            <div class="product_wrap">
		                <div class="item">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/product_1.png" alt="product">
		                    </div>
		                    <div class="info">
		                        <div class="tit">아이앤어스 3챔버 고농축 캡슐세제 실속형 50개입</div>
		                        <div class="price">29,800원</div>
		                    </div>
		                </div>
		                <div class="item">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/product_2.png" alt="product">
		                    </div>
		                    <div class="info">
		                        <div class="tit">NEW 캐츠랑 전연령 점보 20kg</div>
		                        <div class="price">58,000원</div>
		                    </div>
		                </div>
		                <div class="item">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/product_2.png" alt="product">
		                    </div>
		                    <div class="info">
		                        <div class="tit">NEW 캐츠랑 전연령 점보 20kg</div>
		                        <div class="price">58,000원</div>
		                    </div>
		                </div>
		                <div class="item">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/product_2.png" alt="product">
		                    </div>
		                    <div class="info">
		                        <div class="tit">NEW 캐츠랑 전연령 점보 20kg</div>
		                        <div class="price">58,000원</div>
		                    </div>
		                </div>
		                <div class="item">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/product_2.png" alt="product">
		                    </div>
		                    <div class="info">
		                        <div class="tit">NEW 캐츠랑 전연령 점보 20kg</div>
		                        <div class="price">58,000원</div>
		                    </div>
		                </div>
		                <div class="item">
		                    <div class="img_wrap">
		                        <img src="${path}/images/main/product_2.png" alt="product">
		                    </div>
		                    <div class="info">
		                        <div class="tit">NEW 캐츠랑 전연령 점보 20kg</div>
		                        <div class="price">58,000원</div>
		                    </div>
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
		<%@include file="../common/footer.jsp" %>
    </div>
</body>
</html>