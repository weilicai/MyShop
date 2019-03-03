<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShopCar</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />	
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		function del(){
			if(window.confirm("是否移出购物车？")){
				return true;
			}
			else{
				return false;
			}
		}

	</script>
	
</head>
<body>
	<%@include file="/jsp/head.jsp" %>
	<div class="container">
		<div class="row"> 
		<c:if test="${empty shopCarList}">
			<h3>购物车空空如也,亲,请先去逛逛去吧~~~~~~~~~~~</h3>
		</c:if>
		<c:if test="${not empty shopCarList}">
		<div style="margin:0 auto; margin-top:10px;width:950px;">
		<strong style="font-size:16px;margin:5px 0;">购物车详情</strong>

		<table class="table table-bordered">
			<tbody>
			<tr class="warning">
			<th>图片</th>
			<th>商品</th>
			<th>颜色</th>
			<th>尺码</th>
			<th>数量</th>
			<th>价格</th>
			<th>小计</th>
			<th>操作</th>
			</tr>
			
			<c:forEach var="shopCar" items="${shopCarList}">
				<tr class="active">
				<th width="60" width="40%">
					<img width="70" height="60" alt="${shopCar.name}" src="${shopCar.img}"> 
				</th>
				<th>${shopCar.name}</th>
				<th>${shopCar.color}</th>
				<th>${shopCar.size}</th>
				<th><input type="text" readonly="readonly" name="quantity" value="${shopCar.quantity}" maxlength="4" size="10"></th>
				<th>￥${shopCar.price}</th>
				<th>￥${shopCar.amount}</th>
				<th>
					<a href="${pageContext.request.contextPath }/shopCar_inc?id=${shopCar.id}">+</a>&nbsp;
					<a href="${pageContext.request.contextPath }/shopCar_dec?id=${shopCar.id}">-</a>&nbsp;
					<a href="${pageContext.request.contextPath }/shopCar_deleteShopCar?id=${shopCar.id}" onclick="return del()">移出购物车</a>
					<a href="${pageContext.request.contextPath }/order_toBuy?oid=${shopCar.id}">购买</a>
				</th>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		</c:if>
		</div>
	</div>
	<br>
	<%@include file="/jsp/bottom.jsp" %>
</body>
</html>