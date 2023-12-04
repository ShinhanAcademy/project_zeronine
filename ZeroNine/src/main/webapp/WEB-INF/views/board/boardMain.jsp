<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="resources/static/css/boardMain.css" /> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">


<style type="text/css">
#boardList {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

#boardList div {
	flex: 1;
	text-align: left;
	margin: 1.5em;
}

#boardList span {
	margin-left: 50px;
}

#boardList span:nth-child(1) {
	display: block;
	margin-top: 80px;
	margin-bottom: 1.5em;
}

.fast {
	background: #A4D4F4;
	border-top-left-radius: 2em;
	border-top-right-radius: 0.5em;
	border-bottom-right-radius: 0.5em;
	border-bottom-left-radius: 0.5em;
	width: 15em;
	height: 20em;
}

.free {
	background: #7BC1B2;
	border-radius: 0.5em;
	width: 15em;
	height: 20em;
}

.one {
	background: #FED081;
	border-top-left-radius: 0.5em;
	border-top-right-radius: 0.5em;
	border-bottom-right-radius: 2em;
	border-bottom-left-radius: 0.5em;
	width: 15em;
	height: 20em;
}

div.fast span:first-child, div.free span:first-child, div.one span:first-child
	{
	color: black;
	font-family: Jua;
	font-size: 2em;
	font-style: normal;
	font-weight: 400;
	line-height: 1em;
}

div.fast span:nth-child(2), div.free span:nth-child(2), div.one span:nth-child(2)
	{
	color: black;
	font-family: Jua;
	font-size: 4em;
	font-style: normal;
	font-weight: 400;
	line-height: 1em;
}

button {
	width: 4vw;
	height: 4vw;
	position: absolute;
	border: 0;
	top: 50%;
	transform: translateY(-50%);
}

.fastbutton {
	left: 25%;
}

.freebutton {
	right: 38%;
}

.onebutton {
	right: 5%;
}

img {
	width: 4vw;
	height: 4vw;
}

</style>


<title>BoardMain</title>
</head>
<body>
	<div id="boardList">

		<div class="fast">
			<span> 슝슝 </span> <span> 즉배 </span>
		<a class = "fastbutton" href="#">
				<img src="${path}/static/images/arrow.png">
			</a>
		</div>
		<div class="free">
			<span> 알뜰 </span> <span> 무배 </span>
			<a class = "freebutton" href="#">
				<img src="${path}/static/images/arrow.png">
			</a>
		</div>
		<div class="one">
			<span> 1:1 </span> <span> 직거래 </span>
			<a class = "onebutton" href="#">
				<img src="${path}/static/images/arrow.png">
			</a>
		</div>
	</div>

</body>
</html>