package com.itcast.shop.cart.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.itcast.shop.cart.vo.Cart;
import com.itcast.shop.cart.vo.CartItem;
import com.itcast.shop.user.vo.User;

public class CartDao extends HibernateDaoSupport {

	public void addCart(CartItem cartItem) {
		this.getHibernateTemplate().save(cartItem);
	}

	@SuppressWarnings("unchecked")
	public Cart findCart(User existuser) {
		String hql = "from Cart where uid = ?";
		List<Cart> list = this.getHibernateTemplate().find(hql, existuser);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public CartItem findCartItemByCartidPid(Integer cartid, Integer pid) {
		String hql = "from CartItem where cartid= ? and pid = ?";
		List<CartItem> list = this.getHibernateTemplate().find(hql, cartid, pid);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void updateCart(Cart cart) {
		this.getHibernateTemplate().update(cart);
	}

	public void updateCartitem(CartItem existCartitem) {
		this.getHibernateTemplate().update(existCartitem);
	}

	public void saveCart(Cart cart) {
		this.getHibernateTemplate().save(cart);
	}

	public void saveCartitem(CartItem cartItem) {
		this.getHibernateTemplate().save(cartItem);
	}

	public void deleteCartitem(CartItem existCartitem) {
		this.getHibernateTemplate().delete(existCartitem);
	}

	public void deleteCart(Cart cart) {
		this.getHibernateTemplate().delete(cart);
	}

	@SuppressWarnings("unchecked")
	public int findCartItemCount(Integer cartid) {
		String hql = "select count(*) from CartItem where cartid= ?";
		List<Long> list = this.getHibernateTemplate().find(hql,cartid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

}
