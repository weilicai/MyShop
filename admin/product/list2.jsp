<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
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
	</HEAD>
	<body>
		<br>

			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>商品列表</strong>
						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center">
							<form action="${pageContext.request.contextPath }/goods_page">
								种类&nbsp;&nbsp;<input type="text" id="proName" value="" name="name">
								款号&nbsp;&nbsp;<input type="text" id="proName" name="modelNo">
								<input type="submit" value="搜索" >
							</form>
						</td>

					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<form id="Form1" name="Form1" action="${pageContext.request.contextPath}" method="post">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="7%">
										序号
									</td>
									<td align="center" width="17%">
										商品图片
									</td>
									<td align="center" width="17%">
										款号
									</td>
									<td align="center" width="17%">
										商品种类
									</td>
									<td align="center" width="7%">
										颜色
									</td>
									<td align="center" width="7%">
										尺码
									</td>
									<td align="center" width="7%">
										价格
									</td>
									<td align="center" width="7%">
										库存
									</td>
									<td width="7%" align="center">
										修改
									</td>
									<td width="7%" align="center">
										删除
									</td>
									
								</tr>
								<c:forEach var="goods" items="${pageBean.dataList }" varStatus="vs">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="7%">
												${vs.count }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<img width="40" height="45" alt="${goods.name}" src="${goods.img}">
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${goods.modelNo}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${goods.name }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="7%">
												${goods.color}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="7%">
												${goods.size}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="7%">
												${goods.price}
											</td>											
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="7%">
												${goods.inventory}
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/goods_toUpdate?gid=${goods.gid}">
													<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/goods_delete?gid=${goods.gid}" onclick="return del()">
													<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</c:forEach>

							</table>
							</form>
						</td>
					</tr>
					<tr align="center">
						<td colspan="7">
		
							第[<b>${pageBean.currentPage}</b>]页
							
							<c:if test="${pageBean.currentPage!=1 && pageBean.totalPage>0}">
								[<a href="${pageContext.request.contextPath}/goods_page?currentPage=1&name=${goods.name}&modelNo=${goods.modelNo}">首页</a>]
								[<a href="${pageContext.request.contextPath}/goods_page?currentPage=${currentPage-1}&name=${goods.name}&modelNo=${goods.modelNo}">前一页</a>]
							</c:if>
							<c:if test="${pageBean.currentPage != pageBean.totalPage && pageBean.totalPage>0}">
								[<a href="${pageContext.request.contextPath}/goods_page?currentPage=${currentPage+1}&name=${goods.name}&modelNo=${goods.modelNo}">后一页</a>]
								[<a href="${pageContext.request.contextPath}/goods_page?currentPage=${pageBean.totalPage}&name=${goods.name}&modelNo=${goods.modelNo}">尾页</a>]  
							</c:if>	
							,共[<b>${pageBean.totalRecord}</b>]条记录,共[<b>${pageBean.totalPage}</b>]页											
						</td>	
					</tr>
				</TBODY>
			</table>
		
	</body>
</HTML>

