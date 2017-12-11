package com.itcast.shop.product.action;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;

import com.itcast.shop.product.service.ProductService;
import com.itcast.shop.product.vo.Product;
import com.itcast.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ProductAction extends ActionSupport implements
		ModelDriven<Product> {

	private static final long serialVersionUID = 1L;
	private Product product = new Product();

	public Product getModel() {
		return product;
	}

	private ProductService productService;
	// private CategoryService categoryService;
	private Integer cid;
	private Integer csid;
	private int page;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	/*
	 * public void setCategoryService(CategoryService categoryService) {
	 * this.categoryService = categoryService; }
	 */

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String findByPid() {
		product = productService.findByPid(product.getPid());
		return "findByPid";
	}

	public String searchByPagePname() throws UnsupportedEncodingException {
		// String(product.getPname().getBytes("ISO-8859-1"),"UTF-8");
		/*String hpname = product.getPname();
		byte[] bytes = hpname.getBytes("ISO-8859-1");*/
		String hpname = new String(product.getPname().getBytes("ISO-8859-1"),  "UTF-8");
		ActionContext.getContext().put("hpname", hpname);
		PageBean<Product> pageBean = productService.searchByPagePname(hpname,
				page);
		// 存入值栈
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "searchByPagePname";
	}

	public String findByCid() {
		PageBean<Product> pageBean = productService.findByPageCid(cid, page);
		// 存入值栈
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}

	public String findByCsid() {
		PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}

	// 格式化价格 0.00
	public String formatDouble(double s) {
		DecimalFormat fmt = new DecimalFormat("#0.00");
		return fmt.format(s);
	}
}
