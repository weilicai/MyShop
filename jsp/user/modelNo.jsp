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
			var m =$("#modelNo1").val();
			$.ajax({
				type:"POST",
				url:"goods_selectColor",
				data:{"modelNo":m},
				dataType:'text',
				success:function(result){
					eval("var arr = "+result);
					var str = "颜色&nbsp;&nbsp;"
					$.each(arr,function() {
						str += this.color+"<input type='radio' id='color' name='color' value='"+this.color+"'checked onclick='getSize()'>";
					})
						$("#colorDiv").html(str);
				 	getSize(); 
				}
			});
		}  );
		
		function getSize() {
			var m =$("#modelNo1").val();
			var c =  $('input:radio:checked').val();
			$.ajax({
				type:"POST",
				url:"goods_selectSize",
				data:{"modelNo":m,"color":c},
				dataType:'text',
				success:function(result){
					eval("var arr = "+result);
					var str ="尺码&nbsp;&nbsp;";
					$.each(arr,function() {
						str += this.size+"<input type='radio' name='size' value='"+this.size+"'checked>";
					})
					$("#img1").attr('src',arr[0].img);
					$("#sizeDiv").html(str);
					$("#kh").html("款号&nbsp;&nbsp;"+arr[0].modelNo);
					$("#mz").html("商品名&nbsp;&nbsp;"+arr[0].name);
					$("#jg").html("价格&nbsp;&nbsp;￥"+arr[0].price);
					$("#ms").html("描述&nbsp;&nbsp;"+arr[0].dcb);
					document.form1.name.value=arr[0].name;
					document.form1.price.value=arr[0].price;
					document.form1.amount.value=arr[0].price;
				}
			});
		}
       	function inc()
	    {	
			var i=document.form1.quantity.value;
		 	i++;
   			document.form1.quantity.value=i;
   			document.form1.amount.value=Number(i)*Number(document.form1.price.value);
		}	
        function dec()
		{	
	 		var j=document.form1.quantity.value;
  	 		j--;
  	 		if(j<=1)j=1;
   			document.form1.quantity.value=j;
   			document.form1.amount.value=Number(j)*Number(document.form1.price.value);
		}


	</script>
	<script src="js/userlogin.js"></script>
</head>
<body>
	<%@include file="/jsp/head.jsp" %>
	<div class="container">
		<div class="row">
			<fieldset>
			<div id="menu">
				<img id="img1" style="width:360px" src="" align="left" class="height" alt="我是图片">
		    </div>	
			<div id="content" style="float: left">
			

			<form id="form1" name="form1" onsubmit="return userlogin()" action="${pageContext.request.contextPath }/shopCar_add">
				<p style="height: 35px;" id="kh" >款号</p>
				<p style="height: 35px;" id="mz">商品名</p>
				<p style="height: 35px;" id="jg">价格</p>
				<div id="colorDiv" style="height: 35px;"></div>
				<div id="sizeDiv" style="height: 35px;"></div>
				<p style="height: 35px;" id="ms">描述</p>
				<input type="hidden" id="modelNo1" name="modelNo" value="${goods.modelNo }">
				<input type="hidden" name="img" value="0">
				<input type="hidden" name="name" value="0">
				<input type="hidden" name="price" value="0">
				<input type="hidden" name="amount" value="0">
				<input type="hidden" id="username" name="username" value="${username }">
				<p style="height: 35px;">数量
				<button type="button" onclick="dec()">-</button>
				<input type="text" value="1" name="quantity" height="10px">
				<button type="button" onclick="inc()">+</button>
				</p>
				<input style="height:60px;width: 200px;background-color: blue" type="submit" value="加入购物车">
			</form>

			 </div>
			</fieldset>
		</div>
	</div>
	<%@include file="/jsp/bottom.jsp" %>
</body>
</html>