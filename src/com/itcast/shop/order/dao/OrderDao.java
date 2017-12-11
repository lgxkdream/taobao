package com.itcast.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.itcast.shop.order.vo.Order;
import com.itcast.shop.order.vo.OrderItem;
import com.itcast.shop.utils.PageHibernateCallback;

public class OrderDao extends HibernateDaoSupport {

	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}

	@SuppressWarnings("unchecked")
	public int findCountUid(Integer uid) {
		String hql = "select count(*) from Order o where o.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Order> findPageUid(Integer uid, int begin, int limit) {
		String hql = "from Order o where o.user.uid = ? order by ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, new Object[] { uid },
						begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public int findCount() {
		String hql = "select count(*) from Order";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Order> findAllByPage(int begin, int limit) {
		String hql = "from Order order by ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, null, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<OrderItem> findOrderItem(Integer oid) {
		String hql = "from OrderItem oi where oi.order.oid = ?";
		List<OrderItem> list = this.getHibernateTemplate().find(hql, oid);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public Order findByOid(Integer oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}

	public void update(Order order) {
		this.getHibernateTemplate().update(order);
	}

	@SuppressWarnings("unchecked")
	public int findCountState(Integer state) { 
		String hql = "select count(*) from Order where state = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, state);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Order> findPageState(Integer state, int begin, int limit) {
		String hql = "from Order where state = ? order by ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[] { state },begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public void delete(Order currOrder) {
		this.getHibernateTemplate().delete(currOrder);
	}

}
