<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>淘淘网 - 我的订单</title>
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
<link href="${ pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${ pageContext.request.contextPath }/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container header">
	<%@ include file="header.jsp" %>
	
</div>	

<div class="container cart">
    
		<div class="span24">
		
	        <div class="step step1">
			    <br/>
				<font color="#FF6600" size="5" style="font-weight:bolder;font-family:黑体">&nbsp;&nbsp;☞我的订单</font>
			</div>
			    <br/>
		<s:if test="pageBean.totalPage !=0">
				<table>
					<tbody>
					<tr>
						<th width="8%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片</th>
						<th width="37%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						宝贝</th>
						<th width="15%">单价(元)</th>
						<th width="10%">数量</th>
						<th width="15%">实付款(元)</th>
						<th>操作</th>
					</tr>
					<tr><td colspan="6"></td></tr>
					<s:iterator var="o" value="pageBean.list">
					<tr>
					    <th colspan="6">&nbsp;&nbsp;<font size="2" style="font-weight:bolder;font-family:楷体"><s:property value="formatDate(#o.ordertime)" /></font>&nbsp;&nbsp;&nbsp;订单编号：<s:property value="#o.onumber"/>&nbsp;&nbsp;&nbsp;
					    订单状态：
					          <s:if test="#o.state == 0">交易关闭</s:if>
					          <s:if test="#o.state == 1">等待买家付款</s:if>
					          <s:if test="#o.state == 2">买家已付款</s:if>
					          <s:if test="#o.state == 3">卖家已发货</s:if>
					          <s:if test="#o.state == 4">交易成功</s:if>
					    </th>
					</tr>
					
					<tr>
					      <td colspan="4">
					        <table border="0" width="100%">
                                <s:iterator var="oi" value="#o.orderItems">
                                 <tr>
                                       <td width="11.4%"><a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#oi.product.pid"/>">
								                           <img src="${ pageContext.request.contextPath }/<s:property value="#oi.product.image"/>"/></a></td>
                                       <td width="52.9%"><a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#oi.product.pid"/>">
								                           <s:property value="#oi.product.pname"/></a></td>
                                       <td width="21.4%"><s:property value="formatDouble(#oi.product.shop_price)" /></td>
                                       <td ><s:property value="#oi.count"/></td>
                                 </tr>
                                </s:iterator>
                             </table>
					      </td>
					      <td><span class="subtotal"><font size="2" style="font-weight:bolder">
							  <s:property value="formatDouble(#o.total)" /></font></span></td>
					      <td>
					      <a href="${ pageContext.request.contextPath }/order_detailOrder.action?oid=<s:property value="#o.oid"/>">订单详情</a><br/>
					      <s:if test="#o.state == 0"><a href="${ pageContext.request.contextPath }/order_deleteOrder.action?oid=<s:property value="#o.oid"/>&page=<s:property value="pageBean.page"/>">删除订单</a></s:if>
					      <s:if test="#o.state == 1"><a href="${ pageContext.request.contextPath }/order_payOrder.action?oid=<s:property value="#o.oid"/>"><font color="red" style="font-weight: bolder">立即付款</font></a>
					            <br/><a href="${ pageContext.request.contextPath }/order_closeOrder.action?oid=<s:property value="#o.oid"/>&page=<s:property value="pageBean.page"/>">取消订单</a></s:if>
					      <s:if test="#o.state == 2"><a href="${ pageContext.request.contextPath }/order_closeOrder.action?oid=<s:property value="#o.oid"/>&page=<s:property value="pageBean.page"/>">取消订单</a></s:if>
					      <s:if test="#o.state == 3"><a href="${ pageContext.request.contextPath }/order_getOrder.action?oid=<s:property value="#o.oid" />&page=<s:property value="pageBean.page"/>"><font color="red" style="font-weight: bolder">确认收货</font></a></s:if>
					      <s:if test="#o.state == 4"><a href="${ pageContext.request.contextPath }/order_deleteOrder.action?oid=<s:property value="#o.oid"/>&page=<s:property value="pageBean.page"/>">删除订单</a></s:if>
					      </td>
					</tr>
					<tr><td colspan="6"></td></tr>
					<%--
					  <s:iterator var="oi" value="#o.orderItems">
						<tr>
							<td width="60">
							    <a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#oi.product.pid"/>">
								<img src="${ pageContext.request.contextPath }/<s:property value="#oi.product.image"/>"/></a>
							</td>
							<td>
							    <a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#oi.product.pid"/>">
								<s:property value="#oi.product.pname"/></a>
							</td>
							<td>
							    <s:property value="formatDouble(#oi.product.shop_price)" />
							</td>
							<td class="quantity" width="60">
								<s:property value="#oi.count"/>
							</td>
							<td width="140">
								<span class="subtotal"><font size="2" style="font-weight:bolder">
								<s:property value="formatDouble(#oi.subtotal)" /></font></span>
							</td>
							<td>
								<a href="#" class="delete">取消订单</a>
							</td>
						</tr>
					</s:iterator>
					
		--%>
		</s:iterator>
				<tr>
				   <td colspan="6">	       		
		   
	  <div class="pagination">
	    
	        <s:if test="pageBean.page !=1">
	            <a href="${pageContext.request.contextPath }/order_findByUid.action?page=1" class="firstPage"></a>
			    <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page-1"/>" class="previousPage"></a>
			</s:if>
			<s:else>
			    <span class="firstPage"></span>
			    <span class="previousPage"></span>
			</s:else>
			
			<!-- 中间分页码 中间分页码 中间分页码 -->
			<s:if test="pageBean.totalPage>5">
			    <s:if test="(pageBean.page+3)>pageBean.totalPage"> 
			    <span class="ellipsis">…</span>
			    <s:iterator var="p" begin="pageBean.totalPage-4" end="pageBean.totalPage">
		       	<s:if test="pageBean.page !=#p">
			    <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	</s:if>
			    <s:else>
			    <span class="currentPage"><s:property value="#p"/></span>
			    </s:else>
			    </s:iterator>
			    </s:if>
			    
			    <s:else>
			         <s:if test="pageBean.page>3">
			         <span class="ellipsis">…</span>
			         <s:iterator var="p" begin="pageBean.page-2" end="pageBean.page+2">
		           	 <s:if test="pageBean.page !=#p">
			         <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	     </s:if>
			         <s:else>
			         <span class="currentPage"><s:property value="#p"/></span>
			         </s:else>
			         </s:iterator>
			         <span class="ellipsis">…</span>
			         </s:if>
			     <!-- jia yi ge pan duan -->
			         <s:else>
			         <s:iterator var="p" begin="1" end="5">
		           	 <s:if test="pageBean.page !=#p">
			         <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	     </s:if>
			         <s:else>
			         <span class="currentPage"><s:property value="#p"/></span>
			         </s:else>
			         </s:iterator>
			         <span class="ellipsis">…</span>
			         </s:else>
			    </s:else>
			</s:if>
			<s:else>
			    <s:iterator var="p" begin="1" end="pageBean.totalPage">
		       	<s:if test="pageBean.page !=#p">
			    <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	</s:if>
			     <s:else>
			    <span class="currentPage"><s:property value="#p"/></span>
			    </s:else>
			    </s:iterator>
			</s:else>
			<!-- 中间分页码 中间分页码 中间分页码 -->
			
			
			<%--<s:iterator var="p" begin="1" end="pageBean.totalPage">
			<s:if test="pageBean.page !=#p">
			    <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#p"/>"><s:property value="#p"/></a>
			</s:if>
			<s:else>
			    <span class="currentPage"><s:property value="#p"/></span>
			</s:else>
			</s:iterator>
			--%>
			<s:if test="pageBean.page !=pageBean.totalPage">
			    <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page+1"/>" class="nextPage"></a>
			    <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.totalPage"/>" class="lastPage"></a>
			</s:if>
			<s:else>
			    <span class="nextPage"></span>
			    <span class="lastPage"></span>
			</s:else>    
	</div>
	       
		    
		
				   </td>
				</tr>
				
			
			  </tbody>
			</table>	
		 </s:if>
		    <s:else>	
		    <div class="span24">
	            <div style="height:280px">
	               <br/><br/><br/><br/><br/><br/><br/>
	               <center><h1>亲，您还没有订单，快去下单吧!</h1></center>
	            </div>
	         </div>
			</s:else>
		</div>
	</div>
<div class="container footer">
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>