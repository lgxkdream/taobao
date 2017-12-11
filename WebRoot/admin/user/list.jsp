<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css"
			rel="stylesheet" type="text/css" />
		<script language="javascript"
			src="${pageContext.request.contextPath}/js/public.js">
</script>

	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1"
			action="${pageContext.request.contextPath}/user/list.jsp"
			method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center"
				bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>用 户 列 表</strong>
						</TD>
					</tr>
					<tr>

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
									<td align="center" width="10%">
										用户名称
									</td>
									<td align="center" width="7%">
										真实姓名
									</td>
									<td align="center" width="4%">
										性别
									</td>
									<td align="center" width="11%">
										E-mail
									</td>
									<td align="center" width="9%">
										电话
									</td>
									<td align="center" width="15%">
										地址
									</td>
									<td align="center" width="7%">
										用户状态
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										删除
									</td>
								</tr>
								<s:iterator var="u" value="pageBean.list" status="status">
									<tr onmouseover="this.style.backgroundColor = 'white'"
										onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="5%">
											<s:property value="#status.count" />
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="10%">
											<s:property value="#u.username" />
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="7%">
											<s:property value="#u.name" />
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="4%">
											<s:if test="#u.sex=='male'">男</s:if>
											<s:if test="#u.sex=='female'">女</s:if>
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="11%">
											<s:property value="#u.email" />
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="9%">
											<s:property value="#u.phone" />
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="15%">
											<s:property value="#u.addr" />
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="7%">
											<s:if test="#u.state== 1">已激活</s:if>
											<s:if test="#u.state== 0">未激活</s:if>
										</td>
										<td align="center" style="HEIGHT: 22px">
											<a
												href="${ pageContext.request.contextPath }/userAdmin_edit.action?uid=<s:property value="#u.uid"/>">
												<img
													src="${pageContext.request.contextPath}/images/i_edit.gif"
													border="0" style="CURSOR: hand"> </a>
										</td>

										<td align="center" style="HEIGHT: 22px">
											<a
												href="${ pageContext.request.contextPath }/userAdmin_delete.action?uid=<s:property value="#u.uid"/>" onclick="return confirm('确定要删除吗?');">
												<img
													src="${pageContext.request.contextPath}/images/i_del.gif"
													width="16" height="16" border="0" style="CURSOR: hand">
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
									<a
										href="${pageContext.request.contextPath }/userAdmin_findAll.action?page=1"><font
										color="blue">首页</font>
									</a>&nbsp;
			                        <a
										href="${pageContext.request.contextPath }/userAdmin_findAll.action?page=<s:property value="pageBean.page-1"/>"><font
										color="blue">上一页</font>
									</a>&nbsp;
			</s:if>
								<s:else>
									<span>首页</span>&nbsp;
			    <span>上一页</span>&nbsp;
			</s:else>

								<s:iterator var="p" begin="1" end="pageBean.totalPage">
									<s:if test="pageBean.page !=#p">
										<a
											href="${pageContext.request.contextPath }/userAdmin_findAll.action?page=<s:property value="#p"/>"><font
											color="blue"><s:property value="#p" />
										</font>
										</a>
									</s:if>
									<s:else>
										<span class="currentPage"><font size="3"><s:property
													value="#p" />
										</font>
										</span>
									</s:else>
								</s:iterator>



								<s:if test="pageBean.page !=pageBean.totalPage">
									<a
										href="${pageContext.request.contextPath }/userAdmin_findAll.action?page=<s:property value="pageBean.page+1"/>"><font
										color="blue">下一页</font>
									</a>&nbsp;
			                        <a
										href="${pageContext.request.contextPath }/userAdmin_findAll.action?page=<s:property value="pageBean.totalPage"/>"><font
										color="blue">尾页</font>
									</a>&nbsp;
			</s:if>
								<s:else>
									<span>下一页</span>&nbsp;
			    <span>尾页</span>&nbsp;
			</s:else>
							</s:if>

							<s:else>
								<br />
								<br />
								<br />
								<center>
									<h2>
										非常抱歉，暂无二级分类!
									</h2>
								</center>
							</s:else>

						</td>
					</tr>

				</TBODY>
			</table>
		</form>
	</body>
</HTML>

