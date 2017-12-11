package com.itcast.shop.cart.vo;

import java.io.Serializable;

import com.itcast.shop.product.vo.Product;

public class CartItem implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer ciid;
	private Product product;
	private Integer count;
	private Double subtotal;
	private Cart cart;

	public Integer getCiid() {
		return ciid;
	}

	public void setCiid(Integer ciid) {
		this.ciid = ciid;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

}
