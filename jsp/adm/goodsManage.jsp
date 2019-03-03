<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Goods manage</title>
<script type="text/javascript">
	function del(){
		if(window.confirm("是否下架宝贝？")){
			return true;
		}
		else{
			return false;
		}
	}
</script>
</head>
<body>
	<div style="background-color: #d0e4fe">
		<div><h1>帅飞飞时尚男装</h1></div>
		
		<div><span>administrator:${adm.name }</span></div><hr>
	</div>
	<form action="${pageContext.request.contextPath }/goods_select">
		<input type="text" name="name">
		<input type="submit" value="搜索" >
	</form>
	<hr>
	<p><a href="${pageContext.request.contextPath }/goods_toAdd">发布宝贝</a></p>
	<p><a href="${pageContext.request.contextPath }/order_show">用户订单</a></p>
	<table border="1" width="850" cellpadding="0" cellspacing="0">
		<tr align="center">
		<th>款号</th>
		<th>图片</th>
		<th>商品名</th>
		<th>颜色</th>
		<th>尺码</th>
		<th>价格</th>
		<th>库存</th>
		<th>操作</th>
		</tr>
		
		<c:forEach var="goods" items="${goodsList}">
		<tr>
		<th>${goods.modelNo}</th>
		<th><img style="height: 100px" alt="${goods.name}" src="${goods.img}"> </th>
		<th>${goods.name}</th>
		<th>${goods.color}</th>
		<th>${goods.size}</th>
		<th>${goods.price}</th>
		<th>${goods.inventory}</th>
		<th><a href="${pageContext.request.contextPath }/goods_delete?gid=${goods.gid}" onclick="return del()">下架宝贝</a>
			<a href="${pageContext.request.contextPath }/goods_toUpdate?gid=${goods.gid}">修改宝贝</a><br>
		</th>
		</tr>
		</c:forEach>		
	</table>
	<hr>
	<p><a href="index.jsp">返回用户登录</a></p>
</body>
</html>