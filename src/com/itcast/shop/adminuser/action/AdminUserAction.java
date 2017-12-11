package com.itcast.shop.adminuser.action;

import org.apache.struts2.ServletActionContext;

import com.itcast.shop.adminuser.service.AdminUserService;
import com.itcast.shop.adminuser.vo.AdminUser;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminUser adminUser = new AdminUser();
	private AdminUserService adminUserService;

	public AdminUser getModel() {
		return adminUser;
	}

	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}
	
	public String login(){
		AdminUser existAdminUser = adminUserService.login(adminUser);
		if(existAdminUser == null){
			this.addActionError("用户名或密码错误!");
			return "loginFail";
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess";
		}
	}
	
	public String logout(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "logoutSuccess";
	}
	

}
