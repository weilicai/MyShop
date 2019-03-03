<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
		$(function () { $("[data-toggle='tooltip']").tooltip(); });
	</script>
	<script type="text/javascript">
		$(function() {
			var x=$("#username").val();
			if (x!=null && x!=""){
				$("#login").html("<li><a href='user_logout'><span class='glyphicon'>注销"+x+"</span></a></li>")
			  }
			$.ajax({
				type:"POST",
				url:"category_list",
				dataType:'text',
				success:function(result){
 					eval("var arr = "+result);
 					var str = "";
					$.each(arr,function() {
						$("#c_ul").append("<li><a href='${pageContext.request.contextPath}/goods_search?name="+this.category+"'>"+this.category+"</a></li>");
					})
				}
			});
		}  );
	</script> 
	<script src="js/userlogin.js"></script>
	<div class="container-fluid">
	<div class="container-fluid" style="background-color: #d0e4fe;margin-bottom:0">
		<div class="col-md-4">
			<h1><a href="${pageContext.request.contextPath}/index.jsp" data-toggle="tooltip" data-placement="right" title="点击退出店铺">衣客多时尚男装</a></h1>
			<input type="hidden" id="username" value="${username }" >
		</div>
		<div class="col-md-5">
		</div>
		<div class="col-md-3" style="padding-top:20px">
		</div>
	</div>
	</div>
	<div class="container-fluid">
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
	    <div>
      		<ul class="nav navbar-nav">
      			<li class="active"><a href="${pageContext.request.contextPath}/goods_show">首页</a></li>
				<li class="dropdown">
			   		<a href="${pageContext.request.contextPath}/goods_show" class="dropdown-toggle" data-toggle="dropdown">
			   			所有种类 <b class="caret"></b>
              	  	</a>
				    <ul id="c_ul" class="dropdown-menu"></ul>
				</li>
 				<li><a href="${pageContext.request.contextPath}/shopCar_user" onclick="return userlogin()" style="text-decoration: none">购物车</a></li>     			
				<li><a href="${pageContext.request.contextPath}/order_userOrder" onclick="return userlogin()" style="text-decoration: none">我的订单</a></li>
      		</ul>
 		    <ul id="login" class="nav navbar-nav navbar-right">
		      <li><a href="${pageContext.request.contextPath}/user_toRegister"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
		      <li><a href="${pageContext.request.contextPath}/user_tologin"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
		    </ul>
    	</div>
     	<div>
    		<form action="${pageContext.request.contextPath }/goods_search" method="post" class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input  type="text" name="name" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
    	</div>
    	</div>
	</nav>	
	</div>
	<hr>
