<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/boardMain.css" />

<title>BoardMain</title>
</head>
<body>
	<div id="boardList">
		<div class="fast">
			<span> 슝슝 </span> <span> 즉배 </span>
		<a class = "fastbutton" href="${path}/board/boardFast.do">
				<img src="${path}/images/board/arrow.png">
			</a>
		</div>
		<div class="free">
			<span> 알뜰 </span> <span> 무배 </span>
			<a class = "freebutton" href="#">
				<img src="${path}/images/board/arrow.png">
			</a>
		</div>
		<div class="one">
			<span> 1:1 </span> <span> 직거래 </span>
			<a class = "onebutton" href="#">
				<img src="${path}/images/board/arrow.png">
			</a>
		</div>
	</div>

</body>
</html>