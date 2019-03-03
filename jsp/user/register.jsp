<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>注册</title>
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
	<div class="container" style="width:100%;background:url('${pageContext.request.contextPath}/images/regist_bg.jpg');">
		<div class="row"> 
		<div class="col-md-2"></div>
		<div class="col-md-8" style="background:#fff;padding:40px 80px;margin:30px;border:7px solid #ccc;">
			<font>会员注册</font>USER REGISTER
			<form class="form-horizontal" style="margin-top:5px;" method="post" action="${pageContext.request.contextPath }/user_register">
				<input type="hidden" name="method" value="regist">
				 <div class="form-group">
				    <label for="username" class="col-sm-2 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="userName">
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
				    <div class="col-sm-6">
				      <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
				    <div class="col-sm-6">
				      <input type="password" class="form-control" id="confirmpwd" placeholder="请输入确认密码" name="rePassword">
				    </div>
				  </div>
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <input type="submit"  width="100" value="注册" name="submit" border="0"
					    style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
					    height:35px;width:100px;color:white;">
				    </div>
				  </div>
				</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	</div>
	<%@include file="/jsp/bottom.jsp" %>
</body>
</html>