<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<table border="0" width="100%">
   <tr>
        <td align="center" width="20%">图片</td>
        <td align="center" width="45%">商品名称</td>
        <td align="center" width="15%">数量</td>
        <td align="center" width="20%">小计</td>
   </tr>
   <s:iterator var="oi" value="oilist">
   <tr>
        <td align="center" ><img width="35" height="35" src="${pageContext.request.contextPath }/<s:property value="#oi.product.image"/>"/></td>
        <td align="center" ><s:property value="#oi.product.pname"/></td>
        <td align="center" ><s:property value="#oi.count"/></td>
        <td align="center" ><s:property value="formatDouble(#oi.subtotal)" /></td>
   </tr>
   </s:iterator>
</table>