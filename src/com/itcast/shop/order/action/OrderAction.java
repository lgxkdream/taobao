package com.itcast.shop.order.action;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.struts2.ServletActionContext;

import com.itcast.shop.utils.PaymentUtil;
import com.itcast.shop.cart.service.CartService;
import com.itcast.shop.cart.vo.Cart;
import com.itcast.shop.cart.vo.CartItem;
import com.itcast.shop.order.service.OrderService;
import com.itcast.shop.order.vo.Order;
import com.itcast.shop.order.vo.OrderItem;
import com.itcast.shop.user.vo.User;
import com.itcast.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 前台订单管理
 * @author LiGang
 * @date 2016-9-10 下午12:39:14
 * @version v1.0
 */
public class OrderAction extends ActionSupport implements ModelDriven<Order> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Order order = new Order();
	private CartService cartService;
	private OrderService orderService;
	private int page;
	private String message;
	private String pd_FrpId;
	private String r3_Amt;
	private String r6_Order;

	public Order getModel() {
		return order;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setPd_FrpId(String pdFrpId) {
		pd_FrpId = pdFrpId;
	}

	public void setR3_Amt(String r3Amt) {
		r3_Amt = r3Amt;
	}

	public void setR6_Order(String r6Order) {
		r6_Order = r6Order;
	}

	//确认订单
	public String firmOrder() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		Cart cart = cartService.findCart(existuser);
		order.setTotal(cart.getTotal());
		order.setState(1);
		for (CartItem cartItem : cart.getCartItems()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setOrder(order);
			order.getOrderItems().add(orderItem);
		}
		order.setUser(existuser);
		// orderService.save(order);
		// cartService.deleteCart(cart);
		return "firmOrder";
	}

	// 查询订单项数量
	public String findOcountByOid() {
		return "";
	}

	/**
	 * 主页我的订单查询
	 * @return
	 */
	public String findByUid() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		PageBean<Order> pageBean = orderService.findByPageUid(existuser
				.getUid(), page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUid";
	}

	public String findByOid() {
		order = orderService.findByOid(order.getOid());
		return "findByOid";
	}

	//提交订单
	public String saveOrder() throws IOException {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		Cart cart = cartService.findCart(existuser);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Order neworder = new Order();
		String ordernumber = (String.valueOf(System.currentTimeMillis()))
				.substring(0, 10)
				+ (String.valueOf(Math.random())).substring(2, 8);
		neworder.setOnumber(ordernumber);
		neworder.setUser(existuser);
		neworder.setOrdertime(sdf.format(new Date()));
		neworder.setState(2);
		neworder.setTotal(cart.getTotal());
		neworder.setName(order.getName());
		neworder.setPhone(order.getPhone());
		neworder.setAddr(order.getAddr());
		int count = 0;
		for (CartItem cartItem : cart.getCartItems()) {
			OrderItem norderItem = new OrderItem();
			norderItem.setCount(cartItem.getCount());
			norderItem.setProduct(cartItem.getProduct());
			norderItem.setSubtotal(cartItem.getSubtotal());
			norderItem.setOrder(neworder);
			neworder.getOrderItems().add(norderItem);
			count += 1;
		}
		neworder.setOicount(count);
		orderService.save(neworder);
		cartService.deleteCart(cart);
		// 为订单付款
		// 付款需要的参数:
		String p0_Cmd = "Buy"; // 业务类型:
		String p1_MerId = "10001126856";// 商户编号:
		String p2_Order = neworder.getOnumber();// 订单编号:
		// order.getOid().toString()
		String p3_Amt = "0.01"; // 付款金额:
		String p4_Cur = "CNY"; // 交易币种:
		String p5_Pid = ""; // 商品名称:
		String p6_Pcat = ""; // 商品种类:
		String p7_Pdesc = ""; // 商品描述:
		//String p8_Url = "http://localhost:8080/shop/order_callBack.action"; // 商户接收支付成功数据的地址:
		String p8_Url = "http://xkdream.tunnel.qydev.com/taobao/order_callBack.action"; // 商户接收支付成功数据的地址:
		String p9_SAF = ""; // 送货地址:
		String pa_MP = ""; // 商户扩展信息:
		String pd_FrpId = this.pd_FrpId;// 支付通道编码:
		String pr_NeedResponse = "1"; // 应答机制:
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl"; // 秘钥
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue); // hmac
		// 向易宝发送请求:
		StringBuffer sb = new StringBuffer(
				"https://www.yeepay.com/app-merchant-proxy/node?");
		sb.append("p0_Cmd=").append(p0_Cmd).append("&");
		sb.append("p1_MerId=").append(p1_MerId).append("&");
		sb.append("p2_Order=").append(p2_Order).append("&");
		sb.append("p3_Amt=").append(p3_Amt).append("&");
		sb.append("p4_Cur=").append(p4_Cur).append("&");
		sb.append("p5_Pid=").append(p5_Pid).append("&");
		sb.append("p6_Pcat=").append(p6_Pcat).append("&");
		sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		sb.append("p8_Url=").append(p8_Url).append("&");
		sb.append("p9_SAF=").append(p9_SAF).append("&");
		sb.append("pa_MP=").append(pa_MP).append("&");
		sb.append("pd_FrpId=").append(pd_FrpId).append("&");
		sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		sb.append("hmac=").append(hmac);
		// 重定向:向易宝出发:
		ServletActionContext.getResponse().sendRedirect(sb.toString());
		return NONE;
	}

	//立即付款
	public String payOrder() {
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(2);
		orderService.update(currOrder);
		message = currOrder.getOnumber() + " " + this.formatDouble(currOrder.getTotal());
		/*this.addActionMessage("支付成功!订单编号为: " + currOrder.getOnumber()
				+ " 付款金额为: " + currOrder.getTotal());*/
		return "payOrder";
	}

	// 付款成功后跳转回来的路径:
	public String callBack() {
		// 修改订单的状态:
		Order currOrder = orderService.findByOid(Integer.parseInt(r6_Order));
		// 修改订单状态为2:已经付款:
		currOrder.setState(2);
		orderService.update(currOrder);
		this.addActionMessage("支付成功!订单编号为: " + r6_Order + " 付款金额为: " + r3_Amt);
		return "msg";
	}

	public String msgOrder() {
		String s = new String(message);
		String a[] = s.split(" ");
		this.addActionMessage("支付成功!订单编号为: " + a[0] + " 付款金额为: " + a[1]);
		return "msgOrder";
	}
	
	/**
	 * 订单详情
	 * @return
	 */
	public String detailOrder(){
		order = orderService.findByOid(order.getOid());
		return "detailOrder";
	}
	
	/**
	 * 确认收货
	 * @return
	 */
	public String getOrder() {
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(4);
		orderService.update(currOrder);
		return "getOrder";
	}

    /**
     * 取消订单
     * @return
     */
	public String closeOrder() {
		Order currOrder = orderService.findByOid(order.getOid());
		if (currOrder.getState() != 1 && currOrder.getState() != 2) {
			return "closeOrder";
		}
		currOrder.setState(0);
		orderService.update(currOrder);
		return "closeOrder";
	}

	/**
	 * 删除订单
	 */
	public String deleteOrder() {
		User existuser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existuser == null) {
			return "login";
		}
		int count = orderService.findCountUid(existuser.getUid());
		if (count % 5 == 1) {
			if(page != 1){
				page -= 1;
			}
		}
		Order currOrder = orderService.findByOid(order.getOid());
		orderService.deleteOrder(currOrder);
		return "deleteOrder";
	}

	// 格式化价格 0.00
	public String formatDouble(double s) {
		DecimalFormat fmt = new DecimalFormat("#0.00");
		return fmt.format(s);
	}

	// 日期截取年月日
	public String formatDate(String date) {
		String s = new String(date);
		String a[] = s.split(" ");
		return a[0];
	}

}
