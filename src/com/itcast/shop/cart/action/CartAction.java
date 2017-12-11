package com.itcast.shop.cart.action;

import java.text.DecimalFormat;
import org.apache.struts2.ServletActionContext;
import com.itcast.shop.cart.service.CartService;
import com.itcast.shop.cart.vo.Cart;
import com.itcast.shop.cart.vo.CartItem;
import com.itcast.shop.product.service.ProductService;
import com.itcast.shop.product.vo.Product;
import com.itcast.shop.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 前台购物车管理
 * @author LiGang
 * @date 2016-9-10 下午12:44:35
 * @version v1.0
 */
public class CartAction extends ActionSupport implements ModelDriven<Cart> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer pid;
	private Integer count;
	private ProductService productService;
	private CartService cartService;
	private Cart cart;

	public Cart getModel() {
		return cart;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	/**
	 * 添加购物车
	 * @return
	 */
	public String addCart() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		//---------------------------这是测试代码----------------------------------
		/*HttpSession session = (HttpSession) ActionContext.getContext().getSession();
		System.out.println(session.getAttribute("existUser"));
		System.out.println("CartAction");*/
		//---------------------------这是测试代码----------------------------------
		
		if (existuser == null) {
			return "login";
		}
		cart = cartService.findCart(existuser);
		Product product = productService.findByPid(pid);
		if (cart != null) { // && existCartitem != null
			CartItem existCartitem = cartService.findCartItemByCartidPid(cart
					.getCartid(), pid);
			if (existCartitem != null) {// 购物车有该商品
				cart
						.setTotal(cart.getTotal() + product.getShop_price()
								* count);
				existCartitem.setCount(existCartitem.getCount() + count);
				existCartitem.setSubtotal(existCartitem.getSubtotal()
						+ product.getShop_price() * count);
				cartService.updateCart(cart);
				cartService.updateCartitem(existCartitem);
			} else {// 购物车没有该商品
				CartItem cartItem = new CartItem();
				cartItem.setCart(cart);
				cartItem.setCount(count);
				cartItem.setProduct(product);
				cartItem.setSubtotal(product.getShop_price() * count);
				cartService.saveCartitem(cartItem);
				cart
						.setTotal(cart.getTotal() + product.getShop_price()
								* count);
				cartService.updateCart(cart);
			}
		} else {// 购物车为空
			Cart newcart = new Cart();
			newcart.setTotal(product.getShop_price() * count);
			newcart.setUser(existuser);
			cartService.saveCart(newcart);
			CartItem newcartItem = new CartItem();
			newcartItem.setCart(newcart);
			newcartItem.setCount(count);
			newcartItem.setProduct(product);
			newcartItem.setSubtotal(product.getShop_price() * count);
			cartService.saveCartitem(newcartItem);
		}
		return "addCart";
	}

	/**
	 * 添加购物车成功
	 * @return
	 */
	public String msgCart() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		cart = cartService.findCart(existuser);
		int cicount = cartService.findCartItemCount(cart.getCartid());
		Product product = productService.findByPid(pid);
		ActionContext.getContext().put("product", product);
		ActionContext.getContext().put("count", count);      //加入商品数量
		ActionContext.getContext().put("cicount", cicount);  //购物车商品数量
		this.addActionMessage("已成功加入购物车");
		return "msgCart";
	}

	/**
	 * 删除购物车项目
	 * @return
	 */
	public String removeCart() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		cart = cartService.findCart(existuser);
		CartItem existCartitem = cartService.findCartItemByCartidPid(cart
				.getCartid(), pid);
		cart.setTotal(cart.getTotal() - existCartitem.getSubtotal());
		cartService.updateCart(cart);
		cartService.deleteCartitem(existCartitem);
		cart = cartService.findCart(existuser);
		return "mycart";
	}

	/**
	 * 清空购物车
	 * @return
	 */
	public String clearCart() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		cart = cartService.findCart(existuser);
		cartService.deleteCart(cart);
		cart = cartService.findCart(existuser);
		return "mycart";
	}

	/**
	 * 我的购物车
	 * @return
	 */
	public String myCart() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		cart = cartService.findCart(existuser);
		return "mycart";
	}

	/**
	 * 增加订单商品数量
	 * @return
	 */
	public String increaseCount() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		cart = cartService.findCart(existuser);
		CartItem existCartitem = cartService.findCartItemByCartidPid(cart
				.getCartid(), pid);

		cart.setTotal(cart.getTotal()
				+ existCartitem.getProduct().getShop_price());
		cartService.updateCart(cart);
		int ncount = existCartitem.getCount() + 1;
		existCartitem.setCount(ncount);
		existCartitem.setSubtotal(existCartitem.getSubtotal()
				+ existCartitem.getProduct().getShop_price());
		cartService.updateCartitem(existCartitem);
		//cart = cartService.findCart(existuser);
		//return "mycart";
		return NONE;
	}

	/**
	 * 减少订单商品数量
	 * @return
	 */
	public String decreaseCount() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		cart = cartService.findCart(existuser);
		CartItem existCartitem = cartService.findCartItemByCartidPid(cart
				.getCartid(), pid);
		int ncount = existCartitem.getCount() - 1;
		if (ncount == 0) {
			//cart = cartService.findCart(existuser);
			//return "mycart";
			return NONE;
		}
		cart.setTotal(cart.getTotal()
				- existCartitem.getProduct().getShop_price());
		cartService.updateCart(cart);
		existCartitem.setCount(ncount);
		existCartitem.setSubtotal(existCartitem.getSubtotal()
				- existCartitem.getProduct().getShop_price());
		cartService.updateCartitem(existCartitem);

		//cart = cartService.findCart(existuser);
		//return "mycart";
		return NONE;
	}

	// 格式化价格 0.00
	public String formatDouble(double s) {
		DecimalFormat fmt = new DecimalFormat("#0.00");
		return fmt.format(s);
	}

}
