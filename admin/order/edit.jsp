<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body>
		<!--  -->
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/order_update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="img" value="${order.img}">
			<input type="hidden" name="username" value="${order.username}">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
						<strong><STRONG>编辑订单</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						订单号：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" readonly="readonly" name="id" value="${order.id }" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品款号：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="modelNo" value="${order.modelNo}">
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						颜色：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="color" value="${order.color}">
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						尺码：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="size" value="${order.size}">
					</td>
					
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						数量：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="quantity" value="${order.quantity}">
					</td>				
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						金额：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="amount" value="${order.amount}">
					</td>
					
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						地址：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="address" value="${order.address}">
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						购买日期：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" readonly="readonly" name="buyDate" value="${order.buyDate}">
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>