package com.itcast.shop.cart.service;

import org.springframework.transaction.annotation.Transactional;

import com.itcast.shop.cart.dao.CartDao;
import com.itcast.shop.cart.vo.Cart;
import com.itcast.shop.cart.vo.CartItem;
import com.itcast.shop.user.vo.User;

@Transactional
public class CartService {

	private CartDao cartDao;

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	public void addCart(CartItem cartItem) {
		cartDao.addCart(cartItem);
	}

	public Cart findCart(User existuser) {
		return cartDao.findCart(existuser);
	}
	
	public CartItem findCartItemByCartidPid(Integer cartid, Integer pid) {
		return cartDao.findCartItemByCartidPid(cartid,pid);
	}
	
	public void updateCart(Cart cart) {
		cartDao.updateCart(cart);
		
	}
	
	public void updateCartitem(CartItem existCartitem) {
		cartDao.updateCartitem(existCartitem);
	}

	public void saveCart(Cart cart) {
		cartDao.saveCart(cart);
	}
	
	public void saveCartitem(CartItem cartItem) {
		cartDao.saveCartitem(cartItem);
		
	}

	public void deleteCartitem(CartItem existCartitem) {
		cartDao.deleteCartitem(existCartitem);
	}

	public void deleteCart(Cart cart) {
		cartDao.deleteCart(cart);
	}

	public int findCartItemCount(Integer cartid) {
		return cartDao.findCartItemCount(cartid);
	}
	

}
