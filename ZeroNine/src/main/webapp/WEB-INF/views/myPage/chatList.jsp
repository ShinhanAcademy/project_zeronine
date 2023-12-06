<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/mypage_chat.css">
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<!-- zero_container -->
	<div class="zero_container zn_center">
	    <!-- mypage_container -->
	    <div class="mypage_container">
	        <!-- zero_sbn -->
	        <div class="zero_sbn">
	            <div class="title">마이 제로나인</div>
	            <div class="snb_wrap">
	                <div class="sub_tit">MY SHOPPING</div>
	                <ul>
	                    <li><a href="#">나의 지갑</a></li>
	                    <li><a href="#">배송 조회</a></li>
	                    <li><a href="#">주문 내역</a></li>
	                    <li><a href="#">취소 / 반품 / 교환 / 환불 내역</a></li>
	                    <li><a href="#">장바구니</a></li>
	                    <li><a href="#">찜한 상품</a></li>
	                </ul>
	                <div class="sub_tit">MY ACTIVITIES</div>
	                <ul>
	                    <li><a href="#">내가 쓴 게시글</a></li>
	                    <li><a href="#">내가 참여한 게시글</a></li>
	                    <li class="on"><a href="#">채팅 목록</a></li>
	                </ul>
	                <div class="sub_tit">MY INFOMATION</div>
	                <ul>
	                    <li><a href="#">개인 정보</a></li>
	                    <li><a href="#">구독 정보</a></li>
	                </ul>
	            </div>
	        </div>
	        <!-- //zero_sbn -->
	        <!-- mypage_detail_wrap -->
	        <div class="mypage_detail_wrap">
	            <!-- my_info_wrap -->
	            <div class="my_info_wrap">
	                <!-- info_left -->
	                <div class="info_left">
	                    <div class="profile">
	                        <div>
	                            <div class="img_wrap">
	                                <img src="${path}/images/mypage/img_mypage_profile.png" alt="profile image" />
	                            </div>
	                            홍길동 님
	                        </div>
	                    </div>
	                    <ul class="subscription_list">
	                        <li>
	                            <div class="img_wrap">
	                                <img src="${path}/images/mypage/img_bag_small.png" alt="subscription image">
	                            </div>
	                            슝슝 무한 배송 구독중
	                        </li>
	                        <li>
	                            <div class="img_wrap">
	                                <img src="${path}/images/mypage/img_trash_small.png" alt="subscription image">
	                            </div>
	                            쓰레기 수거 구독중
	                        </li>
	                    </ul>
	                </div>
	                <!-- //info_left -->
	                <!-- info_right -->
	                <div class="info_right">
	                    <table>
	                        <tbody>
	                            <tr>
	                                <th>지구 지킴이 횟수</th>
	                                <td>36회</td>
	                            </tr>
	                            <tr>
	                                <th>My Point</th>
	                                <td>
	                                    4,280
	                                    <button class="btn_orange_small">충전하기</button>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>회수 쿠폰</th>
	                                <td>36회</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- //info_right -->
	            </div>
	            <!-- //my_info_wrap -->
	            <!-- contents_wrap -->
	            <div class="contents_wrap">
	                <div class="con_tit has_line">채팅 목록</div>
	                <!-- contents -->
	                <div class="contents">
	                    <!-- chat_list -->
	                    <div class="chat_list">
	                        <!-- chat_inner -->
	                        <div class="chat_inner">
	                            <div class="chat_room">
	                                <div class="profile img_wrap">
	                                    <img src="${path}/images/mypage/img_chat_profile.png" alt="profile image" />
	                                </div>
	                                <div class="info">
	                                    <div class="user_info">
	                                        <div class="name">콩순이</div>
	                                        <span>파리바게뜨 서교점</span>
	                                    </div>
	                                    <div class="message">
	                                        안녕하세요~!! <br>
	                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mattis, lorem condimentum ullamcorper dictum, nulla enim malesuada mi, vel luctus felis eros id risus. Pellentesque porttitor luctus risus id facilisis. Vivamus pharetra at sapien ut lacinia. Nulla vel ultrices nisl, vel hendrerit elit. Donec congue velit in velit hendrerit blandit. Nulla vehicula lorem ut ante pharetra ultrices ac a lorem. Proin ut felis eget risus fermentum tempor vel eget quam. Nam lobortis nulla quis felis sodales fermentum et imperdiet arcu. Vivamus rhoncus ac lorem a vehicula. Praesent leo lorem, ornare dictum magna quis, malesuada commodo orci. Fusce metus neque, vulputate eu malesuada nec, iaculis vel nisl. Nunc feugiat ut ligula eu lacinia. Etiam in eros tellus.
	                                    </div>
	                                    <div class="deadline">D-6 (11/29 23:59까지)</div>
	                                </div>
	                                <div class="read_status">1</div>
	                            </div>
	                            <div class="chat_room">
	                                <div class="profile img_wrap">
	                                    <img src="${path}/images/mypage/img_chat_profile.png" alt="profile image" />
	                                </div>
	                                <div class="info">
	                                    <div class="user_info">
	                                        <div class="name">콩순이</div>
	                                        <span>파리바게뜨 서교점</span>
	                                    </div>
	                                    <div class="message">
	                                        안녕하세요~!! <br>
	                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mattis, lorem condimentum ullamcorper dictum, nulla enim malesuada mi, vel luctus felis eros id risus. Pellentesque porttitor luctus risus id facilisis. Vivamus pharetra at sapien ut lacinia. Nulla vel ultrices nisl, vel hendrerit elit. Donec congue velit in velit hendrerit blandit. Nulla vehicula lorem ut ante pharetra ultrices ac a lorem. Proin ut felis eget risus fermentum tempor vel eget quam. Nam lobortis nulla quis felis sodales fermentum et imperdiet arcu. Vivamus rhoncus ac lorem a vehicula. Praesent leo lorem, ornare dictum magna quis, malesuada commodo orci. Fusce metus neque, vulputate eu malesuada nec, iaculis vel nisl. Nunc feugiat ut ligula eu lacinia. Etiam in eros tellus.
	                                    </div>
	                                    <div class="deadline">D-6 (11/29 23:59까지)</div>
	                                </div>
	                                <div class="read_status">1</div>
	                            </div>
	                            <div class="chat_room">
	                                <div class="profile img_wrap">
	                                    <img src="${path}/images/mypage/img_chat_profile.png" alt="profile image" />
	                                </div>
	                                <div class="info">
	                                    <div class="user_info">
	                                        <div class="name">콩순이</div>
	                                        <span>파리바게뜨 서교점</span>
	                                    </div>
	                                    <div class="message">
	                                        안녕하세요~!! <br>
	                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mattis, lorem condimentum ullamcorper dictum, nulla enim malesuada mi, vel luctus felis eros id risus. Pellentesque porttitor luctus risus id facilisis. Vivamus pharetra at sapien ut lacinia. Nulla vel ultrices nisl, vel hendrerit elit. Donec congue velit in velit hendrerit blandit. Nulla vehicula lorem ut ante pharetra ultrices ac a lorem. Proin ut felis eget risus fermentum tempor vel eget quam. Nam lobortis nulla quis felis sodales fermentum et imperdiet arcu. Vivamus rhoncus ac lorem a vehicula. Praesent leo lorem, ornare dictum magna quis, malesuada commodo orci. Fusce metus neque, vulputate eu malesuada nec, iaculis vel nisl. Nunc feugiat ut ligula eu lacinia. Etiam in eros tellus.
	                                    </div>
	                                    <div class="deadline">D-6 (11/29 23:59까지)</div>
	                                </div>
	                                <div class="read_status">1</div>
	                            </div>
	                            <div class="chat_room">
	                                <div class="profile img_wrap">
	                                    <img src="${path}/images/mypage/img_chat_profile.png" alt="profile image" />
	                                </div>
	                                <div class="info">
	                                    <div class="user_info">
	                                        <div class="name">콩순이</div>
	                                        <span>파리바게뜨 서교점</span>
	                                    </div>
	                                    <div class="message">
	                                        안녕하세요~!! <br>
	                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mattis, lorem condimentum ullamcorper dictum, nulla enim malesuada mi, vel luctus felis eros id risus. Pellentesque porttitor luctus risus id facilisis. Vivamus pharetra at sapien ut lacinia. Nulla vel ultrices nisl, vel hendrerit elit. Donec congue velit in velit hendrerit blandit. Nulla vehicula lorem ut ante pharetra ultrices ac a lorem. Proin ut felis eget risus fermentum tempor vel eget quam. Nam lobortis nulla quis felis sodales fermentum et imperdiet arcu. Vivamus rhoncus ac lorem a vehicula. Praesent leo lorem, ornare dictum magna quis, malesuada commodo orci. Fusce metus neque, vulputate eu malesuada nec, iaculis vel nisl. Nunc feugiat ut ligula eu lacinia. Etiam in eros tellus.
	                                    </div>
	                                    <div class="deadline">D-6 (11/29 23:59까지)</div>
	                                </div>
	                                <div class="read_status">1</div>
	                            </div>
	                            <div class="chat_room">
	                                <div class="profile img_wrap">
	                                    <img src="${path}/images/mypage/img_chat_profile.png" alt="profile image" />
	                                </div>
	                                <div class="info">
	                                    <div class="user_info">
	                                        <div class="name">콩순이</div>
	                                        <span>파리바게뜨 서교점</span>
	                                    </div>
	                                    <div class="message">
	                                        안녕하세요~!! <br>
	                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mattis, lorem condimentum ullamcorper dictum, nulla enim malesuada mi, vel luctus felis eros id risus. Pellentesque porttitor luctus risus id facilisis. Vivamus pharetra at sapien ut lacinia. Nulla vel ultrices nisl, vel hendrerit elit. Donec congue velit in velit hendrerit blandit. Nulla vehicula lorem ut ante pharetra ultrices ac a lorem. Proin ut felis eget risus fermentum tempor vel eget quam. Nam lobortis nulla quis felis sodales fermentum et imperdiet arcu. Vivamus rhoncus ac lorem a vehicula. Praesent leo lorem, ornare dictum magna quis, malesuada commodo orci. Fusce metus neque, vulputate eu malesuada nec, iaculis vel nisl. Nunc feugiat ut ligula eu lacinia. Etiam in eros tellus.
	                                    </div>
	                                    <div class="deadline">D-6 (11/29 23:59까지)</div>
	                                </div>
	                                <div class="read_status">1</div>
	                            </div>
	                        </div>
	                        <!-- //chat_inner -->
	                    </div>
	                    <!-- //chat_list -->
	                </div>
	                <!-- //contents -->
	            </div>
	            <!-- //contents_wrap -->
	        </div>
	        <!-- //mypage_detail_wrap -->
	    </div>
	    <!-- //mypage_container -->
	</div>
	<!-- //zero_container -->
	<%@include file="../common/footer.jsp" %>
</body>
</html>