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
	<script type="text/javascript">
		
		$(function() {
			$.ajax({
				type:"POST",
				url:"order_address",
				data:{parentid:0},
				dataType:'text',
				success:function(result){
					eval("var arr = "+result);
					var str ="";
 					$.each(arr,function() {
						str += "<option value='"+this.areaid+"'>"+this.areaname+"</option>";
					}) 
						$("#province").html(str);
 					getCity();
				}
			});
		}  );
		function getCity() {
			var parentid = $("#province").val();
			$.ajax({
				type:"POST",
				url:"order_address",
				data:{parentid:parentid},
				dataType:'text',
				success:function(result){
					eval("var arr = "+result);
					var str ="";
 					$.each(arr,function() {
						str += "<option value='"+this.areaid+"'>"+this.areaname+"</option>";
					}) 
						$("#city").html(str);
 					getCounty();
 					
				}
			});
		}
		
		function getCounty() {
			var parentid = $("#city").val();
			$.ajax({
				type:"POST",
				url:"order_address",
				data:{parentid:parentid},
				dataType:'text',
				success:function(result){
					eval("var arr = "+result);
					var str ="";
 					$.each(arr,function() {
						str += "<option value='"+this.areaid+"'>"+this.areaname+"</option>";
					}) 
						$("#county").html(str);
				}
			});
		}
		function getDetail(){
			var x=$("#detail").val();
			if (x==null || x==""){
			  alert("请填写详细地址");
			  return false;
			  }
		}
	</script>
</head>
<body>
	<%@include file="/jsp/head.jsp" %>
	<div class="container">
	<div class="row">
		<p>订单号:${shopCar.id }</p>
		<p>颜色:${shopCar.color }</p>
		<p>尺码:${shopCar.size }</p>
		<p>数量:${shopCar.quantity }</p>
		<p>金额:${shopCar.amount }</p>
		<form id="form1" name="form1" onsubmit="return getDetail()" action="${pageContext.request.contextPath}/order_add.action" method="post">
			<input type="hidden" name="oid" value="${shopCar.id }">
			<input type="hidden" name="username" value="${username }">
			<input type="hidden" name="modelNo" value="${shopCar.modelNo }">
			<input type="hidden" name="img" value="${shopCar.img }">
			<input type="hidden" name="color" value="${shopCar.color }">
			<input type="hidden" name="size" value="${shopCar.size }">
			<input type="hidden" name="quantity" value="${shopCar.quantity }">
			<input type="hidden" name="amount" value="${shopCar.amount }">
			<p>地址:
			<select style="width: 100px" id="province" name="province" onclick="getCity()"></select>  
			<select style="width: 100px" id="city" name="city" onclick="getCounty()"></select>  
			<select style="width: 100px" id="county" name="county"></select> 
			</p>
			<p>详细地址：
			<input type="text" id="detail" name="detail">
 			</p>
			<input type="submit" value="确认订单">
		</form>
	</div>
	</div>
	<%@include file="/jsp/bottom.jsp" %>
</body>
</html>