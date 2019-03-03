package cn.itcast.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.entity.Category;
import cn.itcast.service.CategoryService;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
	private Category category = new Category();
	public Category getModel() {
		return category;
	}
	private static final long serialVersionUID = 1L;
	@Resource(name="categoryService")
	private CategoryService categoryService;
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void list() throws Exception {
		List<Category> list = categoryService.findAll();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().println(jsonStr);
    }
	public String findAll() {
		List<Category> list = categoryService.findAll();
		ServletActionContext.getRequest().setAttribute("list", list);
		return "findAll";
	}
	public String toAdd() {
		return "toAdd";
	}
	public String add() {
		categoryService.add(category);
		return "add";
	}
	public String edit() {
		category = categoryService.getOne(category.getId());
		ServletActionContext.getRequest().setAttribute("category", category);
		return "edit";
	}
	public String update() {
		categoryService.update(category);
		return "update";
	}
	public String delete() {
		categoryService.delete(category);
		return "delete";
	}

}
