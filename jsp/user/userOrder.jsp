<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>OrderShow</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="/jsp/head.jsp" %>
	<div class="container">
		<div class="row"> 
		<table border="1" width="850" cellpadding="0" cellspacing="0">
			<tr align="center">
			<th>订单号</th>
			<th>客户</th>
			<th>款号</th>
			<th>商品</th>
			<th>颜色</th>
			<th>尺码</th>
			<th>数量</th>
			<th>金额</th>
			<th>地址</th>
			<th>下单时间</th>
			<th>操作</th>
			</tr>
			
			<c:forEach var="order" items="${orderList}">
			<tr>
			<th>${order.id}</th>
			<th>${order.username}</th>
			<th>${order.modelNo}</th>
			<th><img style="height: 100px" alt="${order.modelNo}" src="${order.img}"> </th>
			<th>${order.color}</th>
			<th>${order.size}</th>
			<th>${order.quantity}</th>
			<th>${order.amount}</th>
			<th>${order.address}</th>
			<th>${order.buyDate}</th>
			<th></th>
			</tr>
			</c:forEach>		
		</table>
		</div>
	</div>
	<%@include file="/jsp/bottom.jsp" %>
</body>
</html>