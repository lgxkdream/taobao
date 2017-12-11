<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="span5">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/index.action"> <img
				src="${pageContext.request.contextPath}/image/logo.jpg"
				alt="淘淘网 Taotao.com - 巴巴啦旗下网站" title="淘淘网 Taobao.com - 巴巴啦旗下网站"> </a>
	</div>
</div>
<div class="span9">
	<div class="headerAd">
		<img src="${pageContext.request.contextPath}/image/header.jpg"
			width="320" height="55" alt="特色服务" title="特色服务">
	</div>
</div>
<div class="span10 last" align="right">
	<div class="topNav clearfix">
		<ul>
		    <s:if test="#session.existUser == null">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user_loginPage.action">亲，请登录</a>|
			</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;">
				<a
					href="${ pageContext.request.contextPath }/user_registPage.action">免费注册</a>|
			</li>
			</s:if>
			
			<s:else>
			<li id="headerUsername" class="headerUsername" style="display: list-item;">
			欢迎您，<a
					href="${ pageContext.request.contextPath }/user_installPage.action?uid=<s:property value="#session.existUser.uid"/>"><s:property value="#session.existUser.name"/></a>
			</li>
			<li id="headerLogout" class="headerLogout" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user_logout.action">[退出]</a>|
			</li>
			<li id="headerOrder" class="headerLogout" style="display: list-item;">
				<a href="${pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a>|
			</li>
			</s:else>
			
			<li>
				<a href="#">会员中心</a> |
			</li>
			<li>
				<a href="#">购物指南</a>
			</li>
			
		</ul>
	</div>
	<div class="cart">
		<a href="${pageContext.request.contextPath}/cart_myCart.action">购物车</a>
	</div>
	<div class="phone">
		客服热线:
		<strong>96008/53277764</strong>
	</div>
</div>
	<div class="search">
    <form id="searchForm" action="${pageContext.request.contextPath}/product_searchByPagePname.action" target="body" method="get">
    	<input type="hidden" name="page" value="1"/>
    	<div class="keyword">
    	<input type="text" name="pname" value="${requestScope.hpname}"/>
    	</div>
    	<a href="javascript:document.getElementById('searchForm').submit();" class="button"></a>
    </form>
	</div>


<div class="span24">
	<ul class="mainNav">
		<li><a href="${ pageContext.request.contextPath }/index.action">首页</a>|</li>
		<s:iterator var="c" value="#session.clist">
			<li><a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"/><s:property value="#c.cname"/></a></li>
		</s:iterator>
	</ul>
</div>
<hr width="99%" color="#fa5a14" size=2/>