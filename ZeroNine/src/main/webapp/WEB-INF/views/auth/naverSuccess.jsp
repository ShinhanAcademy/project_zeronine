<%@page import="com.fasterxml.jackson.databind.util.JSONPObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
	var email = ${result}.response.email;
	var mobile = ${result}.response.mobile;
	var birthday = ${result}.response.birthday;
	var birthyear = ${result}.response.birthyear;
	
	
	console.log(email);
	console.log(mobile);
	console.log(birthday);
	console.log(birthyear);
	
	//console.log(${result});
</script>



</head>
<body>
	<h1> 네이버 로그인 된건가?</h1>
    <h1>email</h1>
    <h1>mobile</h1>
</body>
</html>