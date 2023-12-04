<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Main</title>
<style>
* {
	font-size: 20px;
	font-weight: 700;
	line-height: 1em;
	cursor: pointer;
	color: rgb(0, 0, 0);
}

.logo {
    width: 128px;
    height: 96px;
    margin: 30px 0;
    padding-left: 13px;
    float: left;
}

.banner {
	background-color: #E6F6F4;
	margin: 15px 0px 15px 0px;

}

.logo-first {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    justify-content: center;
	position: relative;
	height: 150px;
	    width: 100%;
	padding: 0 20px;
	margin: 0 auto;
	align-items: center;
	border-bottom: solid 2px;
}

a {
	text-decoration: none; /* 밑줄 제거 */

}

body {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 14px;
	font-weight: 400;
	font-style: normal;
}



.header-top {
	font-size: 20px;
	z-index: 2;
	position: relative;
	overflow: hidden;
	height: 30px;
	padding: 0px 10px;
	margin: 0 auto;
	text-align: right;
	margin-top: 0 !important;
	border: 1px solid black;
}



.header-second {
	border-right: 1px solid rgb(221, 221, 221);
    float: left;
        width: 655px;
    height: 150px;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    flex-direction: row;
    justify-content: center;
}
.header-third {
	display: flex;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: center;
border-right: 1px solid rgb(221, 221, 221);
	height: 150px;
	float: left;
	
	width: 270px;
	box-sizing: border-box;
}



.hthird-middle {
	box-sizing: border-box;
	pointer-events: none;
	width: 50px;
	height: 1px;
}

.body-part {
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 1000px;
	text-align: left;
}
.body-left {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	flex-wrap: nowrap;
	width: 100%;
}

.hthird-a {
	display: flex;
	box-sizing: border-box;
	width: 80px;
	height: 20px;
	font-size: 18px;
	font-weight: 700;
	line-height: 1em;
	cursor: pointer;
	color: rgb(0, 0, 0);
	justify-content: center;
}

h1 {
	color: white;
}

.창업2 {
	height: 240px;
	width: 24%;
	padding-left: 8px;
}

.창업1 {
	height: 240px;
	width: 23%;
	padding-right: 6px;
}
.dist98 {
	display: flex;
	box-sizing: border-box;
	pointer-events: none;
	width: 1px;
	height: 98px;
}
.dist {
	display: flex;
	box-sizing: border-box;
	pointer-events: none;
	width: 1px;
	height: 25px;
}

.jul {
	display: block;
	overflow: hidden;
	pointer-events: none;
	box-sizing: border-box;
	width: 100%;
	height: 1px;
	background-color: #777777;
	opacity: 1;
}

.content {
	width: 50%;
	display: flex;
	align-items: center;
	justify-content: flex-start
}

.bottom-part {
	display: block;
	clear: both;
	width: 100%;
	height: 100%;
	background-color: rgb(241, 242, 246);
	border-top: solid 1px rgb(221, 221, 221);
}





.menufont {
	color: rgb(0, 0, 0);
	font-size: 15px; font-weight : 600; line-height : 1em; text-decoration
	: none;
	margin-bottom: 10px;
	font-weight: 600;
	line-height: 1em;
	text-decoration: none;
}

.menu-sub {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	align-content: center;
	align-items: center;
	justify-content: center;
	box-shadow: 1px 1px 3px 0px gray;
	border-radius: 5px;
}

.menu-sub:hover {
	background-color:whitesmoke;
}

.menudist {
	display: flex;
	box-sizing: border-box;
	pointer-events: none;
	width: 1px;
	height: 5px;
}

.menupng {
	margin-top: 15px; width : 103px;
	height: 100px;
	border-radius: 10px;
	width: 103px;
}

.menulist {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 30px;
	width: 51%;
}
.menuj{
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 34px;
    width: 34%;
    margin-top: 17px;
}
.tn{
display: flex;
    flex-direction: column;
    align-items: center;}
.header-third {
	display: flex;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: center;
border-right: 1px solid rgb(221, 221, 221);
	height: 150px;
	float: left;
	
	width: 270px;
	box-sizing: border-box;
}

.hthird-point{
color:black;
font-size: 18px;
}
</style>
</head>
<body>
	<div class="header-part">
		<div class="logo-first">
			<img class="logo" src="../static/image/logo.png" onclick ="location.href ='Main.jsp';">
			
			<div class="header-second">
				<a class="hthird-a" href="Menu.jsp">메뉴</a>
				<div class="hthird-middle"></div>
				<a class="hthird-a" id=ex href="javascript:void(0);"
					onclick="openInDiv()">매장 찾기</a>
				<div class="hthird-middle"></div>
				<a class="hthird-a" id="loglo1"  onclick ="openlogin1()">주문 내역</a>
				<div class="hthird-middle"></div>
				<a class="hthird-point" id="loglo2"  onclick ="openlogin2()">나의 포인트</a>
			</div>
			<div class="header-third">
			<a class="hthird-a" id="loglo2" href="LoginCheck.do">로그인</a>
			</div>

		</div>
	</div>
	<div class="body-part" id="targetDiv">
		<div class="body-left">
			<img class="logo2" src="${cpath}/images/sangpumpage/banner.png">
			<div class="dist98"></div>
			<div class="Menubar">
			<img class="logo2" src="${cpath}/images/sangpumpage/fluent_basket.png">
			<img class="logo2" src="${cpath}/images/sangpumpage/lotion.png">
			<img class="logo2" src="${cpath}/images/sangpumpage/food_navi.png">
			<img class="logo2" src="${cpath}/images/sangpumpage/raphael_cart.png">
			</div>
			<div class="jul"></div>
			<div class="dist"></div>
			<div class="content"></div>
			<div class="menulist">
			<div id = "all" class="menu-sub" onclick="location.href='Menu.jsp';">
					<img class="menupng" src="../static/image/all.png">
					<div class="menudist"></div>
					<span class="menufont">모든메뉴</span>
				</div>		
				<div id = "gb" class="menu-sub"onclick="location.href='Menu.jsp';">
					<img class="menupng" src="../static/image/김밥천국-김밥1.jpg">
					<div class="menudist"></div>
					<span class="menufont">김밥</span>
				</div>
				<div id = "dc" class="menu-sub"onclick="location.href='Menu.jsp';">
					<img class="menupng" src="../static/image/김밥천국-돈까스.jpg">
					<div class="menudist"></div>
					<span class="menufont">돈까스</span>
				</div>
				<div id = "nd" class="menu-sub"onclick="location.href='Menu.jsp';">
					<img class="menupng" src="../static/image/김밥천국-라볶이.jpg">
					<div class="menudist"></div>
					<span class="menufont">면</span>
				</div>
				<div id = "bb" class="menu-sub"onclick="location.href='Menu.jsp';">
					<img class="menupng" src="../static/image/김밥천국-볶음밥1.jpg">
					<div class="menudist"></div>
					<span class="menufont">볶음밥</span>
				</div>
				<div id="menuj" class="menu-sub" onclick="location.href='Menu.jsp';">
				<div id="tn" class="tn">
					<img class="menupng" src="../static/image/김밥천국-찌개.jpg">
					<div class="menudist"></div>
					<span class="menufont">탕,찌개</span>
				</div>
				</div>
					
					
					</div>
		
			<div class="dist"></div>
			<div class="jul"></div>
			<div class="dist"></div>
			<div class="content">
				<span class="bodyfont">신한김밥 서비스</span>
				<div class="dist"></div>
			</div>


		</div>

	</div>

	<div class="bottom-part">
		
	</div>