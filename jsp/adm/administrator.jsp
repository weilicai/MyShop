<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<body>	
	<div align="center">
	<div style="background-color: #d0e4fe">
		<h1>帅飞飞时尚男装</h1><hr>
	</div>
	<form action="${pageContext.request.contextPath }/adm_login" method="post" target="_parent">
		用户名<input type="text" name="name"><br>
		密&nbsp;&nbsp;&nbsp;&nbsp;码<input type="password" name="password"><br>
		<input type="submit" value="登录">
	</form>
	</div>
</body>
</html>