package com.itcast.shop.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.itcast.shop.utils.PageBean;

import com.itcast.shop.user.dao.UserDao;
import com.itcast.shop.user.vo.User;
import com.itcast.shop.utils.MailUtils;
import com.itcast.shop.utils.UUIDUtils;

@Transactional
public class UserService {

	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	public void save(User user) {
		user.setState(0);
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		user.setCode(code);
		userDao.save(user);
		MailUtils.sendMail(user.getEmail(), code);
	}

	public User findByCode(String code) {

		return userDao.findByCode(code);
	}

	public void update(User existUser) {
		userDao.update(existUser);

	}

	public User login(User user) {
		return userDao.login(user);
	}

	// 业务层用户查询所有
	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示12个
		int limit = 12;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合:
		int begin = (page - 1)*limit;
		List<User> list = userDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}


	public User findByUid(Integer uid) {
		return userDao.findByUid(uid);
	}


	public void delete(User existUser) {
		userDao.delete(existUser);
	}
}
