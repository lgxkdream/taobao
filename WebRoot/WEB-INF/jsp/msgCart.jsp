<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>加入购物车成功</title>
		<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<link href="${pageContext.request.contextPath}/css/common.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/Style1.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="container header">
			<%@ include file="header.jsp"%>
		</div>
		<div class="container cart">
		<div class="span24">
			<div class="step step1">
			    <br/>
				<font color="#FF6600" size="5" style="font-weight:bolder;font-family:黑体">&nbsp;&nbsp;☞我的购物车</font>
			</div>
		
			<table width="100%" border="0" cellspacing="0" style="margin-top: 30px">
			    <tr><td rowspan="4" width="200" align="left">
			         <a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#product.pid"/>">
			         <img width="180" height="180"  src="${pageContext.request.contextPath}/<s:property value="#product.image"/>"/></a>
					 </td >
					 <td rowspan="4" align="left" width="35%">
			            <%--<font size="3">已添加商品：<br/><br/></font>
			            --%>
			            <font size="3" color="#fa5a14"><strong><s:property value="#product.pname"/></strong></font><br/><br/>
			            <font size="3">数量：</font><font size="3" color="#fa5a14"><strong><s:property value="#count"/></strong></font>
					 </td >
					 <td style="padding-top: 0px">
					 
						<font size="4" style="line-height:4;font-weight: bold;float:right"> <s:actionmessage />
						<s:actionerror /> </font>
						<img
							src="${pageContext.request.contextPath}/images/addcart.jpg"
							style="float:right;" width="65" height="55" />
					</td>
					
			    </tr>
			    <tr>
				   <td style="float:right">
				   <font size="4">小计：</font><font size="5" color="#fa5a14" >￥<strong><s:property value="formatDouble(#product.shop_price*#count)"/></strong></font>
				   </td>
				</tr>
				<tr>
				   <td style="float:right">
				   购物车共有<font color="#fa5a14"><s:property value="#cicount"/>件</font>商品
				   </td>
				</tr>
			    <tr>
				   <td style="float:right">
				   
				   <div class="bottom">
				       <a onclick="history.go(-1)" style="cursor:pointer" id="submit" class="submit1"><font size="4" style="font-weight:bolder">‹ 返回商品详情</font></a>
					   <a href="${pageContext.request.contextPath}/cart_myCart.action" id="submit" class="submit2"><font size="4" style="font-weight:bolder">去购物车结算</font></a>
				   </div>
				   </td>
				</tr>
			</table>

		
		
		</div>
		</div>
		<br /><br /><br /><br /><br /><br />
		<div class="container footer">
			<%@ include file="footer.jsp"%>
		</div>
	</body>
</html>