<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/boardMain.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>FastBoard</title>

<style>
img {
	position: relative;
	margin: 20px;
}

#input {
	width: 350px;
	height: 50px;
	background: white;
	border-radius: 15px;
	border: 1px black solid;
}

input, a {
	border: none;
}

#search-btn {
	height: 2rem;
	object-fit: contain;
	position: relative;
	width: 2rem;
}

.edit {
	width: 200px;
height: 53px;
right : 10%;
flex-shrink: 0;
}

.edit>img {
	height: 4.5rem;
	margin: 0rem 1.8rem 0.8rem 0rem;
	object-fit: contain;
	vertical-align: top;
	width: 4.5rem;
}

.edit>span {
	color: #000;
	text-align: center;
	font-family: Jua;
	font-size: 25px;
	font-style: normal;
	font-weight: 400;
}
</style>
</head>
<body>
	<img src="/static/images/banner1.png">
	<div id="boardfast">
		<form action="">
			<div id="input">
				<input type="text" placeholder="상품명, 제조사 검색"> <a href="">
					<button id="search-btn" type="submit"></button>
				</a>
			</div>
		</form>

		<div class="edit">
			<img src="/static/images/edit.png"> <span> 글쓰기 </span>
		</div>
	</div>

</body>
</html>
