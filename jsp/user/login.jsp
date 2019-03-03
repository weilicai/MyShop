<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
		font {
		    color: #3164af;
		    font-size: 18px;
		    font-weight: normal;
		    padding: 0 10px;
		}
	 </style>
</head>
<body>
	<%@include file="/jsp/head.jsp" %>
	<div class="container"  style="width:100%;height:460px;background-color: #d0e4fe;">
		<div class="row"> 
			<div class="col-md-2">
			</div>

			
			<div class="col-md-5">
				<div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:100px;background:#fff;">
					<font>会员登录</font>USER LOGIN ${msg }
					<div>&nbsp;</div>
				<form class="form-horizontal" action="${pageContext.request.contextPath }/user_login" method="post">
					<input type="hidden" name="method" value="login">
				  
				 <div class="form-group">
				    <label for="username" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="username"  placeholder="请输入用户名" name="userName">
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
				    <div class="col-sm-6">
				      <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
				    </div>
				  </div>
				
				<div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				    <input type="submit"  width="100" value="登录" name="submit" border="0"
				    style="background: url('${pageContext.request.contextPath}/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
				    </div>
				 </div>
				</form>
				</div>			
			</div>
			<div class="col-md-5">
				<img alt="图片" src="${pageContext.request.contextPath}/images/back.JPG">
			</div>
		</div>
	</div>
<%@include file="/jsp/bottom.jsp" %>

</body>
</html>