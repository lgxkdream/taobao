package com.itcast.shop.product.adminaction;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import com.itcast.shop.categorysecond.service.CategorySecondService;
import com.itcast.shop.categorysecond.vo.CategorySecond;
import com.itcast.shop.product.service.ProductService;
import com.itcast.shop.product.vo.Product;
import com.itcast.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Product product = new Product();
	private CategorySecondService categorySecondService;
    private ProductService productService;
    private Integer page;
    private File upload;
    private String uploadFileName;
    @SuppressWarnings("unused")
	private String uploadContextType;
    
	public Product getModel() {
		return product;
	}

	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public void setPage(Integer page) {
		this.page = page;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContextType(String uploadContextType) {
		this.uploadContextType = uploadContextType;
	}

	public String findAllByPage(){
		PageBean<Product> pageBean = productService.findAllByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllByPage";
	}
	
	public String addPage(){
		List<CategorySecond> cslist = categorySecondService.findAll();
		ActionContext.getContext().getValueStack().set("cslist", cslist);
		return "addPage";
	}
	
	public String save() throws IOException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		product.setPdate(sdf.format(new Date()));
		if(upload != null){
			String realPath = ServletActionContext.getServletContext().getRealPath("/products");
			File destFile = new File(realPath+"//"+uploadFileName);
			FileUtils.copyFile(upload, destFile);
			product.setImage("products/"+uploadFileName);
		}
		productService.save(product);
		return "saveSuccess";
	}
	
	public String delete(){
		product = productService.findByPid(product.getPid());
		String path = product.getImage();
		if(path != null){
			String realPath = ServletActionContext.getServletContext().getRealPath("/"+path);
			File file = new File(realPath);
			file.delete();
		}
		productService.delete(product);
		return "deleteSuccess";
	}
	
	public String edit(){
		product = productService.findByPid(product.getPid());
	    List<CategorySecond> cslist = categorySecondService.findAll();
		ActionContext.getContext().getValueStack().set("cslist", cslist);
		return "edit";
	}
	
	public String update() throws IOException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		product.setPdate(sdf.format(new Date()));
		if(upload != null){
			String path = product.getImage();
			File file = new File(ServletActionContext.getServletContext().getRealPath("/"+path));
			file.delete();//原图片删除
			String realPath = ServletActionContext.getServletContext().getRealPath("/products");
			File destFile = new File(realPath+"//"+uploadFileName);
			FileUtils.copyFile(upload, destFile);
			product.setImage("products/"+uploadFileName);
		}
		productService.update(product);
		return "updateSuccess";
	}
	
	//格式化价格 0.00
	public String formatDouble(double s) {
		DecimalFormat fmt = new DecimalFormat("#0.00");
		return fmt.format(s);
	}
}
