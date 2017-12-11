<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0080)http://localhost:8080/mango/login.jhtml?redirectUrl=%2Fmango%2Fcart%2Flist.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员登录</title>
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>
<script>
function checkForm(){
	var username = document.getElementById("username").value;
	if (username == null || username == '') {
		document.getElementById("span1").innerHTML ="<font color='red'>用户名不能为空!</font>";	
		document.getElementById("span2").innerHTML ="";
		return false;
	}
		
	var password = document.getElementById("password").value;
	if (password == null || password == '') {
		document.getElementById("span1").innerHTML ="";
		document.getElementById("span2").innerHTML ="<font color='red'>密码不能为空!</font>";
		return false;
	}
}

function changeImg(){
		var oldimg = document.getElementById("captchaImage");
		oldimg.src = "${pageContext.request.contextPath}/checkImg.action?nocache="+ new Date().getTime();	
	}
</script>
</head>
<body>

<div class="container header">
	
	<%@ include file="header.jsp"%>
	
</div>	

<div class="container login">
		<div class="span12">
<div class="ad">
					<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录"/>
</div>		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN 
						
					</div>
					
					<form id="loginForm"  action="${pageContext.request.contextPath}/user_login.action" method="post" novalidate="novalidate"
					onsubmit="return checkForm();">
						<table>
							<tbody><tr>
								<th>
										用户名/E-mail:
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="20" value="aaa"/>
									<span id="span1"></span>
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off" value="aaa"/>
								    <span id="span2"></span>
								</td>
							</tr>
								<tr>
									<th>
										验证码:
									</th>
									<td>
										<span class="fieldSet">
										<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /> 
									    <img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/checkImg.action" onclick="changeImg()" title="点击更换验证码" /> 	
                                        </span>
									</td>
								</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<label>
										<input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="true"/>记住用户名
									</label>
									<label>
										&nbsp;&nbsp;<a >找回密码</a>
									</label>
									<span><font color='red'><s:actionerror/></font></span>
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td id="subbg">
									<input type="submit" class="submit" value="登 录"/>
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;
									
								</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可体验在线购物！
											<a href="${ pageContext.request.contextPath }/user_registPage.action">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody></table>
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