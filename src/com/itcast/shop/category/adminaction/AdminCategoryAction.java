package com.itcast.shop.category.adminaction;

import java.util.List;

import com.itcast.shop.category.service.CategoryService;
import com.itcast.shop.category.vo.Category;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Category category = new Category();
	private CategoryService categoryService;

	public Category getModel() {
		return category;
	}
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}


	public String findAll(){
		List<Category> clist = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("clist", clist);
		return "findAll";
	}
	
	//以下为后台一级管理
	public String save(){
		categoryService.save(category);
		return "saveSuccess";
	}
	
	public String delete(){
		category = categoryService.findByCid(category.getCid());
		categoryService.delete(category);
		return "deleteSuccess";
	}
	
	public String edit(){
		category = categoryService.findByCid(category.getCid());
		return "edit";
	}
	
	public String update(){
		categoryService.update(category);
		return "updateSuccess";
	}
	
}
