<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>


function popup() {
	var url = "login.jsp";
	var name = "popup test";
	var option = "width = 500, height = 500"
	window.open(url,name,option);	
}
</script>
<body>
<a href = "javascript:popup()">로그인</a>


</body>
</html>