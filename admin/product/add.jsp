<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<script type="text/javascript">
			function subm() {
				var filePath = document.form1.upload.value;
				var fileExt = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
				var fileInput = document.getElementById("img").files
				if(filePath==null || filePath==""){
					alert("请上传图片");
					return false;
				}
				if (!checkFileExt(fileExt))
				{
				alert("请上传jpg、gif、png格式的图片文件，重新上传！");
				return false;
				}
				//firfox、chrome等浏览器判断文件大小
				if (fileInput.files && fileInput.files[0]) {
				var size = fileInput.files[0].size;
				if (size>=1048576) {
				alert("你的文件大于1M，超过文件大小限制不能上传");
				return false;
				}
				else if (size == 0) {
				alert("文件不存在或者文件大小为0");
				return false;
				} 
				} else {//IE浏览器判断文件大小
				fileInput.select();
				var url = document.selection.createRange().text;
				try {
				var fso = new ActiveXObject("Scripting.FileSystemObject");
				} catch (e) {
				alert('如果你用的是ie 请将安全级别调低！');
				return false;
				}
				var exist = fso.FileExists(url);
				if(!fso.FileExists(url)){
				alert("文件不存在");
				return false;
				}
				if(fso.GetFile(url).size>=1048576){
				alert("你的文件大于1M，超过文件大小限制不能上传");
				return false; 
				}
				}
 			}
			function selectImage(fileInput) {
				var filePath = fileInput.value;
				var fileExt = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();


				if (!checkFileExt(fileExt))
				{
					alert("请上传jpg、gif、png格式的图片文件，重新上传！");
					return false;
				}
				//firfox、chrome等浏览器判断文件大小
				if (fileInput.files && fileInput.files[0]) {
					var size = fileInput.files[0].size;
					if (size>=1048576) {
					alert("你的文件大于1M，超过文件大小限制不能上传");
					return false;
				}
				   else if (size == 0) {
					alert("文件不存在或者文件大小为0");
					return false;
				} 
				} else {//IE浏览器判断文件大小
					fileInput.select();
					var url = document.selection.createRange().text;
				try {
					var fso = new ActiveXObject("Scripting.FileSystemObject");
				} catch (e) {
					alert('如果你用的是ie 请将安全级别调低！');
					return false;
				}
				var exist = fso.FileExists(url);
				if(!fso.FileExists(url)){
					alert("文件不存在");
					return false;
				}
				if(fso.GetFile(url).size>=1048576){
					alert("你的文件大于1M，超过文件大小限制不能上传");
					return false; 
				}
				}
				}

			function checkFileExt(ext){
				if (!ext.match(/.jpg|.gif|.png/i)) {
					return false;
				}
				return true;
			}

		</script>
	</HEAD>
	
	<body>
		<!--  -->
		<form id="userAction_save_do" name="form1" onsubmit="return subm()" action="${pageContext.request.contextPath}/goods_add" method="post" enctype="multipart/form-data">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
						<strong><STRONG>添加商品</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品款号：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="modelNo" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品类目：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="name">
							<c:forEach var="cate" items="${categoryList}">
								<option value="${cate.category}" <c:if test="${cate.category == goods.name }">selected</c:if> >${cate.category}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品颜色：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="color" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品尺码：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="size">
							<c:forEach var="size" items="${sizeList}">
								<option value="${size.size}" <c:if test="${size.size == goods.size}">selected</c:if> >${size.size}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品价格：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="price" class="bg">
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品库存：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="inventory">
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="file" id="img" name="upload">
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="dcb" rows="5" cols="30"></textarea>
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