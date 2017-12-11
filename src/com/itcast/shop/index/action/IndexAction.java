package com.itcast.shop.index.action;

import java.util.List;

import com.itcast.shop.category.service.CategoryService;
import com.itcast.shop.category.vo.Category;
import com.itcast.shop.product.service.ProductService;
import com.itcast.shop.product.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService;
	private ProductService productService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public String execute(){	
		//查询一级分类
		List<Category> clist=categoryService.findAll();
		ActionContext.getContext().getSession().put("clist", clist);
		//查询热门商品
		List<Product> phlist= productService.findHot();
		List<Product> pnlist= productService.findNew();
		ActionContext.getContext().getValueStack().set("phlist", phlist);
		ActionContext.getContext().getValueStack().set("pnlist", pnlist);
		return "index";
	}

}
