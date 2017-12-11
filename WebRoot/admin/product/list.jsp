<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/adminProduct_addPage.action";
			}
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>商 品 列 表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button type="button" id="add" name="add" value="添加" class="button_add" onclick="addProduct()" style="cursor:hand">
&#28155;&#21152;
</button>

						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="5%">
										序号
									</td>
									<td align="center" width="6%">
										商品图片
									</td>
									<td align="center" width="14%">
										商品名称
									</td>
									<td align="center" width="5%">
										商品价格
									</td>
									<td align="center" width="4%">
										是否热门
									</td>
									<td align="center" width="7%">
										上新时间
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										下架
									</td>
								</tr>
								<s:iterator var="p" value="pageBean.list" status="status">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="HEIGHT: 22px" align="center"
												width="5%">
												<s:property value="#status.count"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
											    width="6%">
												<img alt="商品图片" width="45" height="40" src="${pageContext.request.contextPath}/<s:property value="#p.image"/>"
												onmouseout="width=45,height=40" onmouseover="width=90,height=80">
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="14%">
												<s:property value="#p.pname"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="5%">
												<s:property value="formatDouble(#p.shop_price)" />
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="4%">
												<s:if test="#p.is_hot==0">否</s:if>
												<s:if test="#p.is_hot==1">是</s:if>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="7%">
												<s:property value="#p.pdate"/>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/adminProduct_edit.action?pid=<s:property value="#p.pid"/>">
													<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/adminProduct_delete.action?pid=<s:property value="#p.pid"/>" onclick="return confirm('确定要下架吗?');">
													<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</s:iterator>	
							</table>
						</td>
					</tr>
					
			<tr align="right">
				<td class="ta_01" align="right">
					<s:if test="pageBean.totalPage !=0">
	        <s:if test="pageBean.page !=1">
	            <a href="${pageContext.request.contextPath }/adminProduct_findAllByPage.action?page=1"><font color="blue">首页</font></a>&nbsp;
			    <a href="${pageContext.request.contextPath }/adminProduct_findAllByPage.action?page=<s:property value="pageBean.page-1"/>"><font color="blue">上一页</font></a>&nbsp;
			</s:if>
			<s:else>
			    <span>首页</span>&nbsp;
			    <span>上一页</span>&nbsp;
			</s:else>
			
			<s:iterator var="p" begin="1" end="pageBean.totalPage">
			<s:if test="pageBean.page !=#p">
			    <a href="${pageContext.request.contextPath }/adminProduct_findAllByPage.action?page=<s:property value="#p"/>"><font color="blue"><s:property value="#p"/></font></a>
			</s:if>
			<s:else>
			    <span class="currentPage"><font size="3"><s:property value="#p"/></font></span>
			</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page !=pageBean.totalPage">
			    <a href="${pageContext.request.contextPath }/adminProduct_findAllByPage.action?page=<s:property value="pageBean.page+1"/>"><font color="blue">下一页</font></a>&nbsp;
			    <a href="${pageContext.request.contextPath }/adminProduct_findAllByPage.action?page=<s:property value="pageBean.totalPage"/>"><font color="blue">尾页</font></a>&nbsp;
			</s:if>
			<s:else>
			    <span>下一页</span>&nbsp;
			    <span>尾页</span>&nbsp;
			</s:else>    
	    </s:if>
	    
			<s:else>
			<br/><br/><br/>
			<center><h2>非常抱歉，暂无商品!</h2></center>
			</s:else>
					    
					    </td>
					</tr>
					
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

