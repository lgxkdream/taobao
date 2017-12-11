<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>淘淘网 - 我的购物车</title>
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<script  type="text/javascript">
     function createXmlHttp(){
		         var xmlHttp;
		          try{ // Firefox, Opera 8.0+, Safari
		                xmlHttp=new XMLHttpRequest();
		           } catch (e){
			      try{ // Internet Explorer6.0
			            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			       } catch (e){
			      try{ // Internet Explorer5.5及更早版本
			            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      } catch (e){
			    	  throw e;
			      }
			    }
		     }
		     	return xmlHttp;
	 }

    function increaseCount(pid){
		//var newcount = parseInt(document.getElementById("count"+pid).value,10)+1;
		//document.getElementById("count"+pid).value = newcount;	
		//window.location='${pageContext.request.contextPath}/cart_increaseCount.action?pid='+pid; 
		
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){	
				if(xhr.status == 200){
					var newcount = parseInt(document.getElementById("count"+pid).value,10)+1;
					document.getElementById("count"+pid).value = newcount;
					
					var price = parseFloat(document.getElementById("price"+pid).innerHTML);
					var subtotal = parseFloat(document.getElementById("subtotal"+pid).innerHTML);
					var total = parseFloat(document.getElementById("total").innerHTML);
					document.getElementById("subtotal"+pid).innerHTML = (subtotal + price).toFixed(2);
					document.getElementById("total").innerHTML = (total + price).toFixed(2);
					document.getElementById("effectivePoint").innerHTML = ((total + price) / 85).toFixed(2);
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/cart_increaseCount.action?pid="+pid,true);
		// 4.发送
		xhr.send(null);
        
	}
    
    function decreaseCount(pid){
		<%-- 
		var newcount = parseInt(document.getElementById("count"+pid).value,10);
		if(newcount == 1){
			document.getElementById("count"+pid).value = newcount;	
		}else{
			newcount = newcount - 1;
		    document.getElementById("count"+pid).value = newcount;	
		}
		window.location='${pageContext.request.contextPath}/cart_decreaseCount.action?pid='+pid; --%>
		
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){	
				if(xhr.status == 200){
					var newcount = parseInt(document.getElementById("count"+pid).value,10);
					if(newcount > 1){
					    document.getElementById("count"+pid).value = newcount-1;	
					    
					    var price = parseFloat(document.getElementById("price"+pid).innerHTML);
					    var subtotal = parseFloat(document.getElementById("subtotal"+pid).innerHTML);
					    var total = parseFloat(document.getElementById("total").innerHTML);
					    document.getElementById("subtotal"+pid).innerHTML = (subtotal - price).toFixed(2);
					    document.getElementById("total").innerHTML = (total - price).toFixed(2);
					    document.getElementById("effectivePoint").innerHTML = ((total - price) / 85).toFixed(2);
					}
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/cart_decreaseCount.action?pid="+pid,true);
		// 4.发送
		xhr.send(null);
		
	}
</script>
</head>
<body>
<div class="container header">
	
	<%@ include file="header.jsp" %>
</div>	

<div class="container cart">
		<div class="span24">
			<div class="step step1">
			    <br/>
				<font color="#FF6600" size="5" style="font-weight:bolder;font-family:黑体">&nbsp;&nbsp;☞我的购物车</font>
			</div>
			    <br/>
		<s:if test="model.cartItems.size() != 0">
				<table>
					<tbody><tr>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;图片</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						商品</th>
						<th>单价(元)</th>
						<th>数量</th>
						<th>金额(元)</th>
						<th>操作</th>                                  
					</tr>
					    <s:iterator var="cartItem" value="model.cartItems">
						<tr>
							<td width="7%">
								<a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#cartItem.product.pid"/>">
								<img src="${pageContext.request.contextPath}/<s:property value="#cartItem.product.image"/>"/></a>
							</td>
							<td>
						    	<a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#cartItem.product.pid"/>"><s:property value="#cartItem.product.pname"/></a>
							</td>
							<td width="12%">
								<font id="price<s:property value="#cartItem.product.pid"/>" size="2" style="font-weight:bolder;font-family:楷体">
								<s:property value="formatDouble(#cartItem.product.shop_price)" /></font>
							</td>
							<td class="quantity" width="12%">
								<input type="text" id="count<s:property value="#cartItem.product.pid"/>" name="count" value="<s:property value="#cartItem.count"/>" maxlength="4" readonly="readonly"/>
								<div>
									<span id="increase" class="increase" onclick="increaseCount(<s:property value="#cartItem.product.pid"/>)"></span>
									<span id="decrease" class="decrease" onclick="decreaseCount(<s:property value="#cartItem.product.pid"/>)"></span>
								</div>
							</td>
							<td width="12%">
								<font id="subtotal<s:property value="#cartItem.product.pid"/>" color="#FF6600" size="2" style="font-weight:bolder;font-family:楷体">
								<s:property value="formatDouble(#cartItem.subtotal)" /></font>
							</td>
							<td width="12%">
								<a href="${pageContext.request.contextPath}/cart_removeCart.action?pid=<s:property value="#cartItem.product.pid"/>" class="delete">删除</a>
							</td>
						</tr>
					   </s:iterator>	
				</tbody></table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
							<em>
								登录后确认是否享有优惠
							</em>
					赠送淘金币: <em id="effectivePoint"><s:property value="formatDouble(model.total/85)" /></em>
					商品金额: <strong id="effectivePrice">￥<font id="total" size="5" style="font-weight:bolder;font-family:楷体"><s:property value="formatDouble(model.total)" /></font></strong>
				</div>
				<div class="bottom">
					<a href="${pageContext.request.contextPath}/cart_clearCart.action" id="clear" class="clear">清空购物车</a>
					<a href="${pageContext.request.contextPath}/order_firmOrder.action" id="submit" class="submit"><font size="5" style="font-weight:bolder">结&nbsp;算</font></a>
				</div>
	    </s:if>
	    <s:else>
	         <div class="span24">
	            <div style="height:280px">
	               <br/><br/><br/><br/><br/><br/><br/>
	               <center><h1>亲，购物车宝宝快要饿昏了!</h1></center>
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