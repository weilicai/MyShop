<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>OrderShow</title>
</head>
<body>
	<div style="background-color: #d0e4fe">
		<div><h1>帅飞飞时尚男装</h1></div>
		<div><span>administrator:${adm.name }</span></div><hr>
	</div>
	<form action="${pageContext.request.contextPath }/">
		<input type="text" name="name">
		<input type="submit" value="搜索" >
	</form>
	<hr>
	<p><a href="${pageContext.request.contextPath }/goods_list">商品管理</a></p>
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
		<th><a href="${pageContext.request.contextPath }/order_delete?id=${order.id}">删除订单</a>
			<a href="${pageContext.request.contextPath }/order_toUpdate?id=${order.id}">修改订单</a><br>
		</th>
		</tr>
		</c:forEach>		
	</table>
	<hr>
	<p><a href="index.jsp">返回用户登录</a></p>
</body>
</html>