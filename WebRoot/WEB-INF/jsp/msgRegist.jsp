<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>注册会员提示</title>
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
		
		<div class="container register">
		<div class="span24">
		
		<table width="100%" border="2" cellspacing="0" style="margin-top: 30px">
		
			<tr>   
			       <td rowspan="2" height="140" width="25%"></td>
			       <td rowspan="2" width="15%">
			          <img src="${pageContext.request.contextPath}/images/registsuccess.jpg" width="128" height="128" />
			       </td>
		
			       <td>
			            <font size="5" color="#fa5a14" style="line-height:4;font-weight: bold">
			            <s:actionmessage/>
	                    <s:actionerror/></font>
			       </td>
			</tr>
			<tr>
			       <td></td>
			</tr>
		    <tr>
		           <td colspan="3" height="180"></td>
		    </tr>
		
		</table>
		</div>
		</div>
		<div class="container footer">
			<%@ include file="footer.jsp"%>
		</div>
	</body>
</html>