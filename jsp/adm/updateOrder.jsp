<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="background-color: #d0e4fe">
		<h1>帅飞飞时尚男装</h1><hr>
	</div>
	<form action="${pageContext.request.contextPath }/order_update" method="post">
		<p>ID=${order.id}<input type="hidden" name="id" value="${order.id }"></p>
		<p>款号<input type="text" name="modelNo" value="${order.modelNo}"></p>
		<p>颜色<input type="text" name="color" value="${order.color}"></p>
		<p>尺码<input type="text" name="size" value="${order.size}"> </p>
		<p>数量<input type="text" name="quantity" value="${order.quantity}"></p>
		<p>图片<input type="hidden" name="img" value="${order.img}"></p>
		<p>金额<input type="text" name="amount" value="${order.amount}"></p>
		<p>地址<input type="text" name="address" value="${order.address}"></p>
		<p>购买日期 ${order.buyDate}<input type="hidden" name="buyDate" value="${order.buyDate}"></p>
		<input type="hidden" name="oid" value="${order.oid}">
		<input type="hidden" name="username" value="${order.username}">
		<p><input type="submit" value="修改订单"></p>
	</form>
</body>
</html>