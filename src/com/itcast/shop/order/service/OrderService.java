package com.itcast.shop.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.itcast.shop.order.dao.OrderDao;
import com.itcast.shop.order.vo.Order;
import com.itcast.shop.order.vo.OrderItem;
import com.itcast.shop.utils.PageBean;

@Transactional
public class OrderService {
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void save(Order order) {
		orderDao.save(order);
	}

	public PageBean<Order> findByPageUid(Integer uid, int page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		pageBean.setPage(page);
		int limit = 5;
		pageBean.setLimit(limit); // 每页数量
		int totalCount = 0;
		totalCount = orderDao.findCountUid(uid);
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		// totalPage = (int) Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1) * limit;
		List<Order> list = orderDao.findPageUid(uid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	public PageBean<Order> findAllByPage(Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		int totalCount = orderDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1) * limit;
		List<Order> olist = orderDao.findAllByPage(begin, limit);
		pageBean.setList(olist);
		return pageBean;
	}

	public List<OrderItem> findOrderItem(Integer oid) {
		return orderDao.findOrderItem(oid);
	}

	public Order findByOid(Integer oid) {
		return orderDao.findByOid(oid);
	}

	public void update(Order order) {
		orderDao.update(order);
	}

	public PageBean<Order> findByPageState(Integer page, Integer state) {
		PageBean<Order> pageBean = new PageBean<Order>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit); // 每页数量
		int totalCount = 0;
		totalCount = orderDao.findCountState(state);
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		// totalPage = (int) Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1) * limit;
		List<Order> list = orderDao.findPageState(state, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	public void deleteOrder(Order currOrder) {
		orderDao.delete(currOrder);
	}

	public int findCountUid(Integer uid) {
		return orderDao.findCountUid(uid);
	}

}
