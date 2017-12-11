<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>淘淘网 - 账户设置</title>
		<link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
		<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css" />
		<script>
    function checkForm() {
	// 校验用户名:
	// 获得用户名文本框的值:
	var password = document.getElementById("password").value;
	if (password == null || password == '') {
		document.getElementById("span2").innerHTML ="<font color='red'>密码不能为空!</font>";
		document.getElementById("span3").innerHTML ="";
		document.getElementById("span4").innerHTML ="";
		return false;
	}

	var repassword = document.getElementById("repassword").value;
	if (repassword != password) {
		if (repassword == null || repassword == '') {
		document.getElementById("span3").innerHTML ="<font color='red'>确认密码不能为空!</font>";
	    }else{
	    	document.getElementById("span3").innerHTML ="<font color='red'>两次输入的密码不一致!</font>";  	
	    }
		document.getElementById("span2").innerHTML ="";
		document.getElementById("span4").innerHTML ="";
		return false;
	}

	var email = document.getElementById("email").value;
	if (email == null || email == '') {
		document.getElementById("span4").innerHTML ="<font color='red'>E-mail不能为空!</font>";
		document.getElementById("span2").innerHTML ="";
		document.getElementById("span3").innerHTML ="";
		return false;
	}
}
    
	
</script>
	</head>
	<body>
		<div class="container header">

			<%@ include file="header.jsp"%>

		</div>
		<div class="container register">
			<div class="span24">
				<div class="wrap">
					<div class="main clearfix">
						<div class="title">
							<strong>账户设置</strong>USER INSTALL
						</div>
						<form id="installForm" action="${pageContext.request.contextPath}/user_install.action" method="post" novalidate="novalidate"
							onsubmit="return checkForm();">
							<input type="hidden" name="uid" value="<s:property value="model.uid"/>" />
							<table>
								<tbody>
									<tr>
										<th>
											<span class="requiredField">*</span>用户名:
										</th>
										<td>
											<input type="text" id="username" name="username" class="text"
												maxlength="20" value="<s:property value="model.username"/>" readonly="readonly"/>
										</td>
									</tr>
									<tr>
										<th>
											<span class="requiredField">*</span>密&nbsp;&nbsp;码:
										</th>
										<td>
											<input type="password" id="password" name="password"
												class="text" maxlength="20" autocomplete="off" value="<s:property value="model.password"/>"/>
											<span id="span2"></span>	
										</td>
									</tr>
									<tr>
										<th>
											<span class="requiredField">*</span>确认密码:
										</th>
										<td>
											<input type="password" id="repassword" name="repassword"
												class="text" maxlength="20" autocomplete="off"/>
											<span id="span3"></span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="requiredField">*</span>E-mail:
										</th>
										<td>
											<input type="text" id="email" name="email" class="text"
												maxlength="200" value="<s:property value="model.email"/>"/>
											<span id="span4"></span>
										</td>
									</tr>
									<tr>
										<th>
											姓名:
										</th>
										<td>
											<input type="text" name="name" class="text" maxlength="200" value="<s:property value="model.name"/>"/>
										</td>
									</tr>
									<tr>
										<th>
											性别:
										</th>
										<td>
										    <%--<s:if test="model.sex == 'male'"><span class="fieldSet"> <label>
													<input type="radio" name="sex" value="male" checked="checked"/>
													男
												</label> <label>
													<input type="radio" name="sex" value="female" />
													女
												</label> </span>
											</s:if>
										    <s:if test="model.sex == 'female'"><span class="fieldSet"> <label>
													<input type="radio" name="sex" value="male" />
													男
												</label> <label>
													<input type="radio" name="sex" value="female" checked="checked"/>
													女
												</label> </span>
											</s:if>
											--%>
											<span class="fieldSet"> <label>
													<input type="radio" name="sex" value="male" <s:if test="model.sex =='male'">checked</s:if>/>
													男
												</label> <label>
													<input type="radio" name="sex" value="female" <s:if test="model.sex =='female'">checked</s:if>/>
													女
											</label> </span>
										</td>
									</tr>
									<tr>
										<th>
											电话:
										</th>
										<%--
										onfocus="WdatePicker();" 日期控件
										--%>
										<td>
											<input type="text" name="phone" class="text" value="<s:property value="model.phone"/>"/>
										</td>
									</tr>

									<tr>
										<th>
											地址:
										</th>
										<td>
											<input type="text" name="addr" class="text" maxlength="200" value="<s:property value="model.addr"/>"/>
										</td>
									</tr>
									
									
									<tr>
										<th>
											&nbsp;

										</th>
										<td>
											<input type="submit" class="submit" value="确认修改" />
										</td>
									</tr>

								</tbody>
							</table>
							<div class="login">
								<div class="ad">
									<dl>
										<dt>
											注册即享受
										</dt>
										<dd>
											正品保障、正规发票
										</dd>
										<dd>
											货到付款、会员服务
										</dd>
										<dd>
											自由退换、售后上门
										</dd>
									</dl>
								</div>
								<dl>
									<dt>
										已经拥有账号了？
									</dt>
									<dd>
										立即登录即可体验在线购物！
										<a href="${ pageContext.request.contextPath }/user_loginPage.action">立即登录</a>
									</dd>
								</dl>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="container footer">
		<%@ include file="footer.jsp"%>
		</div>
	</body>
</html>