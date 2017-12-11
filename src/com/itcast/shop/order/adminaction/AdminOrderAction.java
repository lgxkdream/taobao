package com.itcast.shop.order.adminaction;

import java.text.DecimalFormat;
import java.util.List;

import com.itcast.shop.order.service.OrderService;
import com.itcast.shop.order.vo.Order;
import com.itcast.shop.order.vo.OrderItem;
import com.itcast.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminOrderAction extends ActionSupport implements ModelDriven<Order>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Order order = new Order();
	private OrderService orderService;
	private Integer page;

	public Order getModel() {
		return order;
	}
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String findAllByPage(){
		PageBean<Order> pageBean = orderService.findAllByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllByPage";
	}
	
	public String findOrderItem(){
		List<OrderItem> oilist = orderService.findOrderItem(order.getOid());
		ActionContext.getContext().getValueStack().set("oilist", oilist);
		return "findOrderItem";
	}
	
	public String sendOrder(){
		Order currorder = orderService.findByOid(order.getOid());
		if(currorder.getState() != 2){
			return "sendOrder";
		}
		currorder.setState(3);
		orderService.update(currorder);
		return "sendOrder";
	}
	
	public String sendOrderByState(){
		Order currorder = orderService.findByOid(order.getOid());
		if(currorder.getState() != 2){
			return "sendOrder";
		}
		currorder.setState(3);
		orderService.update(currorder);
		return "sendOrderByState";
	}
	
	public String findByPageState(){
		PageBean<Order> pageBean = orderService.findByPageState(page,order.getState());
	    ActionContext.getContext().put("state", order.getState());
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByPageState";
	}

	//格式化价格 0.00
	public String formatDouble(double s) {
		DecimalFormat fmt = new DecimalFormat("#0.00");
		return fmt.format(s);
	}
}
