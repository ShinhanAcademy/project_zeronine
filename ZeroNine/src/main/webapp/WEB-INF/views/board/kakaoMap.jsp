<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 주소 검색 api test</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f8319ad3e87a23d9e09852a09ba8028"></script>
<script type="text/javascript" src="<c:url value='/js/kakaoApi.js' />"></script>
</head>
<body>

<script>
$.ajax({
		url : "https://dapi.kakao.com/v2/local/search/address.json?query=전북 삼성동 100",
		type : "GET",
		headers : {"Authorization": "KakaoAK 	541a67b3c7684c9057ee9e734dd5ee5a"},
		success : function(data){
				console.log(data);
		},
		error : function(e){
			console.log(e);
		}
		
})
</script>
</body>
</html>