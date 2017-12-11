package com.itcast.shop.categorysecond.adminaction;

import java.util.List;

import com.itcast.shop.category.service.CategoryService;
import com.itcast.shop.category.vo.Category;
import com.itcast.shop.categorysecond.service.CategorySecondService;
import com.itcast.shop.categorysecond.vo.CategorySecond;
import com.itcast.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CategorySecond categorySecond = new CategorySecond();
	private CategoryService categoryService;
	private CategorySecondService categorySecondService;
	private Integer page;

	public CategorySecond getModel() {
		return categorySecond;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String findAllByPage(){
		PageBean<CategorySecond> pageBean = categorySecondService.findAllByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllByPage";
	}
	 
	//跳转到添加页面，查询所有一级分类
	public String addPage(){
		List<Category> clist = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("clist", clist);
		return "addPage";
	}
	
	public String save(){
		categorySecondService.save(categorySecond);
		return "saveSuccess";
	}
	
	public String delete(){
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}
	
	public String edit(){
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		List<Category> clist = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("clist", clist);
		return "edit";
	}
	
	public String update(){
		categorySecondService.update(categorySecond);
		return "updateSuccess";
	}
	
}
