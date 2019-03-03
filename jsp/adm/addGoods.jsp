<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布宝贝</title>
</head>
<body>
	<div style="background-color: #d0e4fe">
		<h1>帅飞飞时尚男装</h1><hr>
	</div>
	<form action="${pageContext.request.contextPath }/goods_add" method="post" enctype="multipart/form-data">
		<p>款号<input type="text" name="modelNo"></p>
		<p>类目
			<select name="name">
				<c:forEach var="cate" items="${categoryList}">
					<option value="${cate.category}">${cate.category}</option>
				</c:forEach>
			</select>
		</p>
		<p>颜色<input type="text" name="color"></p>
		<p>尺码
			<select name="size">
				<c:forEach var="size" items="${sizeList}">
					<option value="${size.size}">${size.size}</option>
				</c:forEach>
			</select>
		</p>
		<p>价格<input type="text" name="price"></p>
		<p>库存<input type="text" name="inventory"></p>
		<p>描述<input type="text" name="dcb"></p>
		<p>上传图片<input type="file" name="upload"></p>
		<p><input type="submit" value="发布宝贝"></p>
	</form>
</body>
</html>