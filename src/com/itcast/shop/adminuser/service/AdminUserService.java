package com.itcast.shop.adminuser.service;

import org.springframework.transaction.annotation.Transactional;

import com.itcast.shop.adminuser.dao.AdminUserDao;
import com.itcast.shop.adminuser.vo.AdminUser;

@Transactional
public class AdminUserService {
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}

}
