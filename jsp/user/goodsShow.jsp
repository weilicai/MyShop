<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Goods Show</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<%@include file="/jsp/head.jsp" %>
	<div class="container">
	<div class="row">
		<c:forEach var="goods" items="${goodsList}">
			<div class="col-sm-3">
				<a href="${pageContext.request.contextPath }/goods_toModelNo?modelNo=${goods.modelNo}"><img style="height: 250px" src="${goods.img} " alt="${goods.name}"></a>
				<p style="color:red">￥${goods.price }</p>
				<a href="${pageContext.request.contextPath }/goods_toModelNo?modelNo=${goods.modelNo}">${goods.dcb}</a>
			</div>
		</c:forEach>
	</div>
	</div>
	<%@include file="/jsp/bottom.jsp" %>
</body>
</html>