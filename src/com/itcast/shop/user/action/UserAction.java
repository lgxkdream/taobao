package com.itcast.shop.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.itcast.shop.user.service.UserService;
import com.itcast.shop.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 前台账户相关功能
 * @author LiGang
 * @date 2016-9-10 下午12:38:28
 * @version v1.0
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 模型驱动使用的对象
	private User user = new User();

	public User getModel() {
		return user;
	}
	
	public String captcha;

	public void setCheckcode(String captcha) {
		this.captcha = captcha;
	}

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String registPage() {
		return "registPage";
	}

	/**
	 * 注册页面判断用户名是否存在
	 * @return NONE
	 * @throws IOException
	 */
	public String findByUsername() throws IOException {
		User existUser = userService.findByUsername(user.getUsername());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if (existUser != null) { // 用户名已存在
			response.getWriter().println("<font color='red'>用户名已经存在!</font>");
		} else {
			response.getWriter().println("<font color='green'>用户名可以使用!</font>");
		}
		return NONE;
	}

	/**
	 * 用户注册
	 * @return
	 */
	public String regist() {
		String checkcode= (String)ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if(!captcha.equalsIgnoreCase(checkcode)){
			this.addActionError("验证码输入错误!");
			return "registPage";
		}
		userService.save(user);
		return "registSuccess";
	}
	
	/**
	 * 跳转注册成功页面
	 * @return
	 */
	public String msgRegist(){
		this.addActionMessage("注册成功，请去邮箱激活!");
		return "msgRegist";
	}
	
	/**
	 * 用户激活
	 * @return
	 */
	public String active(){
		User existUser = userService.findByCode(user.getCode());
		if(existUser == null){
			this.addActionMessage("亲，已经激活了，快去登陆吧!");
		}else{
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功，请去登陆!");
		}
		return "msgRegist";
	}
	
	/**
	 * 跳转到用户登录界面
	 * @return
	 */
	public String loginPage() {
		return "loginPage";
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	public String login(){
		String pcheckcode= (String)ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		    if(!captcha.equalsIgnoreCase(pcheckcode)){
			this.addActionError("验证码输入错误!");
			return "loginPage";
		}
		User existUser = userService.login(user);
		if(existUser == null){
			this.addActionError("登录失败：用户名密码错误或用户未激活!");
			return LOGIN;
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			return "loginSuccess";
		}
	}
	
	/**
	 * 跳转账户设置界面
	 * @return
	 */
	public String installPage(){
		user = userService.findByUid(user.getUid());
		return "installPage";
	}
	
	/**
	 * 账户设置
	 * @return
	 */
	public String install(){
		user.setState(1);
		user.setCode(null);
		userService.update(user);
		return "install";
	}
	
	/**
	 * 退出登陆
	 * @return
	 */
	public String logout(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "logout";
	}
	
}
