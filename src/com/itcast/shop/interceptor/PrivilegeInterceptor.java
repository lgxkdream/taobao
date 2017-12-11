package com.itcast.shop.interceptor;

import org.apache.struts2.ServletActionContext;

import com.itcast.shop.adminuser.vo.AdminUser;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 后台权限校验的拦截器
 * 对没有登陆的用户不可进行访问
 * @author DELLcomputer
 *
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//执行拦截的方法
	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser == null){
			ActionSupport actionSupport = (ActionSupport) actionInvocation.getAction();
			actionSupport.addActionError("对不起，您还未登录!");
			return "loginFail";
		}else{
			return actionInvocation.invoke(); //已登录，放行
		}
	}

}
