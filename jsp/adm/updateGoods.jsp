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
	<form action="${pageContext.request.contextPath }/goods_update.action" method="post">
		<p>ID=${goods.gid}<input type="hidden" name="gid" value="${goods.gid }"></p>
		<p>款号<input type="text" name="modelNo" value="${goods.modelNo}"></p>
		<p>商品
			<select name="name">
				<c:forEach var="cate" items="${categoryList}">
					<option value="${cate.category}" <c:if test="${cate.category == goods.name }">selected</c:if> >${cate.category}</option>
				</c:forEach>
			</select>
		</p>
		<p>颜色<input type="text" name="color" value="${goods.color}"></p>
		<p>尺码
			<select name="size">
				<c:forEach var="size" items="${sizeList}">
					<option value="${size.size}" <c:if test="${size.size == goods.size}">selected</c:if> >${size.size}</option>
				</c:forEach>
			</select>
		</p>
		<p>价格<input type="text" name="price" value="${goods.price}"></p>
		
		<p>库存<input type="text" name="inventory" value="${goods.inventory}"></p>
		<p>描述<input type="text" name="dcb" value="${goods.dcb}"></p>
		<p>图片<input type="hidden" name="img" value="${goods.img}"></p>
		<p><input type="submit" value="修改宝贝"></p>
	</form>
</body>
</html>