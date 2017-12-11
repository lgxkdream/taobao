<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>淘淘网 - 确认订单</title>
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
				<font color="#FF6600" size="4" style="font-weight:bolder;font-family:黑体">&nbsp;&nbsp;☞确认订单信息</font>
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
					商品金额(含运费)：<font size="4">￥</font><strong id="effectivePrice"><font size="5" style="font-weight:bolder;font-family:楷体"><s:property value="formatDouble(model.total)" /></font></strong>
				</div>
			<form id="orderForm" action="${ pageContext.request.contextPath }/order_saveOrder.action" method="post">
				<div class="span24">
					<p>
							收&nbsp;货&nbsp;人：<input name="name" type="text" value="<s:property value="model.user.name"/>" style="height:30px;width:150px" />
								<br /> 
							联系方式：<input name="phone" type="text"value="<s:property value="model.user.phone"/>" style="height:30px;width:150px" />
                                <br />
                            收货地址：<input name="addr" type="text" value="<s:property value="model.user.addr"/>" style="height:30px;width:350px" />
								
						</p>
						<hr />
						<p>
							选择银行：<br/>
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
							<img src="${ pageContext.request.contextPath }/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
							<img src="${ pageContext.request.contextPath }/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
							<img src="${ pageContext.request.contextPath }/bank_img/abc.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
							<img src="${ pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
							<img src="${ pageContext.request.contextPath }/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
							<img src="${ pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
							<img src="${ pageContext.request.contextPath }/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
							<img src="${ pageContext.request.contextPath }/bank_img/cmb.bmp" align="middle"/>
						</p>
						<hr />
						<%--<p style="text-align:right">
							<a href="javascript:document.getElementById('orderForm').submit();">
								<img src="${ pageContext.request.contextPath }/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
							
						</p>		
						--%>
						<div class="bottom">
						       <a href="${pageContext.request.contextPath}/cart_myCart.action"><font size="2" color="blue">⇚  返回购物车</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        <a href="javascript:document.getElementById('orderForm').submit();" id="submit" class="submit"><font size="5" style="font-weight:bolder">提交订单</font></a>
				       </div>	
				</div>
			</form>
		</div>
		
	</div>
<div class="container footer">
<%@ include file="footer.jsp"%>
</div>
</body>
</html>