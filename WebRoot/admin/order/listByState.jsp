<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">
		      function createXmlHttp(){
		         var xmlHttp;
		          try{ // Firefox, Opera 8.0+, Safari
		                xmlHttp=new XMLHttpRequest();
		           } catch (e){
			      try{// Internet Explorer
			            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			       } catch (e){
			      try{
			            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      } catch (e){}
			    }
		     }
		     	return xmlHttp;
	       }
		    
		     function showDetail(oid){
		    	var but = document.getElementById("but"+oid);
		    	var div = document.getElementById("div"+oid);
		    	if(but.value == "订单详情"){
		     	// 1.创建异步交互对象
	        	var xhr = createXmlHttp();
	           	// 2.设置监听
	         	xhr.onreadystatechange = function(){
		     	if(xhr.readyState == 4){	
				    if(xhr.status == 200){
					     div.innerHTML = xhr.responseText;
				     }
			    }
	        	}
		         // 3.打开连接
		         xhr.open("GET","${pageContext.request.contextPath}/adminOrder_findOrderItem.action?time="+new Date().getTime()+"&oid="+oid,true);
		         // 4.发送
	           	xhr.send(null);
		        but.value = "关闭详情";
		    	}else{
		    		div.innerHTML = "";
		    		but.value = "订单详情";
		    	}
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
							<strong>
							<c:if test="${requestScope.state == 1}">未付款</c:if>
							<c:if test="${requestScope.state == 2}">待发货</c:if>
							<c:if test="${requestScope.state == 3}">已发货</c:if>
							<c:if test="${requestScope.state == 4}">完成的</c:if>
							订单列表</strong>
						</Td>
					</tr>
					
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="2%">
										序号
									</td>
									<td align="center" width="4%">
										订单编号
									</td>
									<td align="center" width="2%">
										总金额
									</td>
									<td align="center" width="4%">
										下单时间
									</td>
									<td align="center" width="2%">
										收货人
									</td>
									<td align="center" width="3%">
										电话
									</td>
									<td align="center" width="6%">
										收货地址
									</td>
									<td align="center" width="4%">
										订单状态
									</td>
									<td width="7%" align="center">
										订单详情
									</td>
									
								</tr>
								<s:iterator var="o" value="pageBean.list" status="status">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="HEIGHT: 22px" align="center"
												width="2%">
												<s:property value="#status.count"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="4%">
												<s:property value="#o.onumber"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="2%">
												<s:property value="formatDouble(#o.total)" />
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="4%">
												<s:property value="#o.ordertime"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="2%">
												<s:property value="#o.name"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="3%">
												<s:property value="#o.phone"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="6%">
												<s:property value="#o.addr"/>
											</td>
											<td style="HEIGHT: 22px" align="center"
												width="4%">
												<s:if test="#o.state==1">等待买家付款</s:if>
												<s:if test="#o.state==2">买家已付款（<a href="${pageContext.request.contextPath}/adminOrder_sendOrderByState.action?oid=<s:property value="#o.oid"/>"><font color="blue">发货</font></a>）</s:if>
												<s:if test="#o.state==3">卖家已发货</s:if>
												<s:if test="#o.state==4">交易成功</s:if>
											</td>
											
											<td align="center" style="HEIGHT: 22px">
												<input id="but<s:property value="#o.oid"/>" type="button" value="订单详情" style="cursor:hand" onclick="showDetail(<s:property value="#o.oid"/>)">
											    <div id="div<s:property value="#o.oid"/>"></div>
											   
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
	            <a href="${pageContext.request.contextPath }/adminOrder_findByPageState.action?page=1&state=${requestScope.state}"><font color="blue">首页</font></a>&nbsp;
			    <a href="${pageContext.request.contextPath }/adminOrder_findByPageState.action?page=<s:property value="pageBean.page-1"/>&state=${requestScope.state}"><font color="blue">上一页</font></a>&nbsp;
			</s:if>
			<s:else>
			    <span>首页</span>&nbsp;
			    <span>上一页</span>&nbsp;
			</s:else>
			
			<s:iterator var="p" begin="1" end="pageBean.totalPage">
			<s:if test="pageBean.page !=#p">
			    <a href="${pageContext.request.contextPath }/adminOrder_findByPageState.action?page=<s:property value="#p"/>&state=${requestScope.state}"><font color="blue"><s:property value="#p"/></font></a>
			</s:if>
			<s:else>
			    <span class="currentPage"><font size="3"><s:property value="#p"/></font></span>
			</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page !=pageBean.totalPage">
			    <a href="${pageContext.request.contextPath }/adminOrder_findByPageState.action?page=<s:property value="pageBean.page+1"/>&state=${requestScope.state}"><font color="blue">下一页</font></a>&nbsp;
			    <a href="${pageContext.request.contextPath }/adminOrder_findByPageState.action?page=<s:property value="pageBean.totalPage"/>&state=${requestScope.state}"><font color="blue">尾页</font></a>&nbsp;
			</s:if>
			<s:else>
			    <span>下一页</span>&nbsp;
			    <span>尾页</span>&nbsp;
			</s:else>    
	    </s:if>
	    
			<s:else>
			<br/><br/><br/>
			<center><h2>非常抱歉，暂无订单!</h2></center>
			</s:else>
					    
					    </td>
					</tr>
					
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

