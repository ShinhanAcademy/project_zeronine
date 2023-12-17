<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="zn_header">
        <div class="zn_center">
            <div class="head_in">
                <div class="top">
                    <h1 class="logo">
                        <a href="${path}/main/main.do"></a>
                    </h1>
                    <div class="member">
                        <ul>
                            <!--- 로그인 전-->
                            <li>
                                <a href="${path}/auth/login.do">로그인</a>
                            </li>
                            <li>
                                <em></em>
                            </li>
                            <li>
                                <a href="${path}/auth/joinMembership.do">회원가입</a>
                            </li>
                                
                            <li>
                                <em></em>
                            </li>
                            <li>
                                <a href="javascript:void(0)">고객센터</a>
                                <div class="drop_menu">
                                    <p>
                                        <a href="javascript:void(0)">공지사항</a>
                                    </p>
                                    <p>
                                        <a href="javascript:void(0)">자주하는 문의</a>
                                    </p>
                                    <p>
                                        <a href="javascript:void(0)">1:1 문의</a>
                                    </p>
                                    <p>
                                        <a href="javascript:void(0)">제안하기</a>
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="bot">
                    <div class="menu">
                        <ul>
                            <li class="category">
                                <a href="javascript:void(0)">카테고리</a> 
                                <div class="ctg_box" style="display: none;">
                                    <ul class="depth1">
                                        <li class="ctg1">
                                            <a href="javascript:void(0)"><span class="bold">정기배송</span></a>
                                        </li>
                                        <li class="ctg2">
                                            <a href="javascript:void(0)"><span class="bold">그린샵</span></a>
                                        </li>
                                        <li class="ctg3">
                                            <a href="javascript:void(0)"><span class="bold">에코딜</span></a>
                                        </li>
                                        <li class="ctg4">
                                            <a href="javascript:void(0)"><span class="bold">베스트</span></a>
                                        </li>
                                        <li class="ctg5">
                                            <a href="javascript:void(0)"><span class="bold">MD추천</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:void(0)">i’m eco</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">제로웨이스트</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">이벤트</a>
                            </li>
                        </ul>
                    </div>
                    <div class="member">
                        <ul>
                            <li>
                                <!-- <form action="https://imecomall.co.kr/v2/shop/search.php" method="get"> -->
                                <div class="search_area">                                        
                                    <!-- <input type="hidden" name="sfl" value="it_name">
                                    <input type="hidden" name="sop" value="and"> -->
                                    <input type="text" name="q" placeholder="즐거운 에코케어">
                                    <button type="submit"></button>                                        
                                </div>
                                <!-- </form> -->
                            </li>
                            <li class="icon_btn">
                                <button type="button" class="wish" onclick="location.href='${path}/myPage/likeProduct.do';"></button>
                            </li>
                            <li class="icon_btn">
                                <button type="button" class="my" onclick="location.href='${path}/myPage/myWallet.do';"></button>
                            </li>
                            <li class="icon_btn">
                                <button type="button" class="cart" onclick="location.href='${path}/myPage/myCart.do';"></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</header>