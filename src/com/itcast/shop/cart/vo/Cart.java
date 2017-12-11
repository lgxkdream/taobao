package com.itcast.shop.cart.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.itcast.shop.user.vo.User;

public class Cart implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer cartid;
	private Double total;
	private Set<CartItem> cartItems = new HashSet<CartItem>();
	private User user;

	public Integer getCartid() {
		return cartid;
	}

	public void setCartid(Integer cartid) {
		this.cartid = cartid;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Set<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Set<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*
	 * public void addCart(CartItem cartItem) { Integer pid =
	 * cartItem.getProduct().getPid(); 
	 * if (mycart.containsKey(pid)) { CartItem oldCartItem = mycart.get(pid);
	 * oldCartItem.setCount(oldCartItem.getCount() + cartItem.getCount()); }
	 * else { mycart.put(pid, cartItem); } total += cartItem.getSubtotal(); }
	 * 
	 * public void removeCart(Integer pid) { // CartItem cartItem =
	 * mycart.get(pid); CartItem cartItem = mycart.remove(pid); total -=
	 * cartItem.getSubtotal(); }
	 * 
	 * public void clearCart() { mycart.clear(); total = 0; }
	 */
}
