<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>淘淘网 - 订单详情</title>
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
				<font color="#FF6600" size="4" style="font-weight:bolder;font-family:黑体">&nbsp;&nbsp;☞订单详情</font>
			</div>
		
				<table>
					<tbody>
					
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>单价(元)</th>
						<th>数量</th>
						<th>小计(元)</th>
					</tr>
					<s:iterator var="oi" value="model.orderItems">
						<tr>
							<td width="60">
								<input type="hidden" name="id" value="22"/>
								<img src="${ pageContext.request.contextPath }/<s:property value="#oi.product.image"/>"/>
							</td>
							<td>
								<a target="_blank"><s:property value="#oi.product.pname"/></a>
							</td>
							<td>
								<s:property value="formatDouble(#oi.product.shop_price)" />
							</td>
							<td class="quantity" width="60">
								<s:property value="#oi.count"/>
							</td>
							<td width="140">
							    <font color="#FF6600" size="2" style="font-weight:bolder;font-family:楷体">
								<s:property value="formatDouble(#oi.subtotal)" /></font>
							</td>
							
						</tr>
				 </s:iterator>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					实付款(含运费)：<font size="4">￥</font><strong id="effectivePrice"><font size="5" style="font-weight:bolder;font-family:楷体"><s:property value="formatDouble(model.total)" /></font></strong>
				</div>
			<hr />
				<div class="span24">
					        <font color="#FF6600">订单编号：</font><font size="3" style="font-weight:bolder"><s:property value="model.onumber"/></font><br/>
					        <font color="#FF6600">创建时间：</font><font size="3" style="font-weight:bolder"><s:property value="model.ordertime"/></font><br/><br/>
							<font color="#FF6600">收&nbsp;货&nbsp;&nbsp;人：</font><font size="3" style="font-weight:bolder"><s:property value="model.name"/></font><br/>
							<font color="#FF6600">联系方式：</font><font size="3" style="font-weight:bolder"><s:property value="model.phone"/></font><br/>
                            <font color="#FF6600">收货地址：</font><font size="3" style="font-weight:bolder"><s:property value="model.addr"/></font>
					<hr />
					<div class="bottom">
						       <a onclick="history.go(-1)" style="cursor:pointer"><font size="2" color="blue">⇚  返回我的订单</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    </div>		
				</div>
		</div>
		
	</div>
<div class="container footer">
<%@ include file="footer.jsp"%>
</div>
</body>
</html>