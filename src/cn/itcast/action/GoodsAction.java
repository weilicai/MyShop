package cn.itcast.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.entity.Category;
import cn.itcast.entity.Goods;
import cn.itcast.entity.PageBean;
import cn.itcast.entity.Pager;
import cn.itcast.entity.Size;
import cn.itcast.service.CategoryService;
import cn.itcast.service.GoodsService;
import cn.itcast.utils.UploadUtils;
@SuppressWarnings("all")
public class GoodsAction extends ActionSupport implements ModelDriven<Goods>{
	private Img2Base64Util imgBase = new Img2Base64Util();
	private Goods goods = new Goods();
	public Goods getModel() {
		return goods;
	}
	@Resource(name="goodsService")
	private GoodsService goodsService;
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	@Resource(name="categoryService")
	private CategoryService categoryService;
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public String list() {
		List<Goods> goodsList = goodsService.findAll();
		goodsList = base64Img(goodsList);
		ServletActionContext.getRequest().setAttribute("goodsList", goodsList);
		return "list";
	}
	
	public String toUpdate() {
		goods = goodsService.findOne(goods.getGid());
		List<Size> sizeList = goodsService.findSize();
		List<Category> categorylist = categoryService.findAll();
		ServletActionContext.getRequest().setAttribute("sizeList", sizeList);
		ServletActionContext.getRequest().setAttribute("categorylist", categorylist);
		ServletActionContext.getRequest().setAttribute("goods", goods);
		return "toUpdate";
	}
	
	public String update() {
		goodsService.update(goods);
		return "update";
	}
	
	public String delete() {
		goodsService.delete(goods);
		return "delete";
	}
	
	
	public String toAdd() {
		List<Size> sizeList = goodsService.findSize();
		List<Category> categorylist = categoryService.findAll();
		ServletActionContext.getRequest().setAttribute("sizeList", sizeList);
		ServletActionContext.getRequest().setAttribute("categoryList", categorylist);
		return "toAdd";
	}
	
	private File upload;
	private String uploadFileName;
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	public String add() throws Exception{
		UploadUtils uploadUtils = new UploadUtils();
		String realName = uploadUtils.getRealName(uploadFileName);
		String uuidName = uploadUtils.getUUIDName(realName);
		if(upload != null) {
			File serverFile = new File("F:\\sff_shop\\images"+"\\"+uuidName);
			FileUtils.copyFile(upload, serverFile);
			goods.setImg("F:\\sff_shop\\images"+"\\"+uuidName);
		}
		goodsService.add(goods);
		return "add";
	}
	
	public String select() {
		List<Goods> goodsList = goodsService.select(goods);
		goodsList = base64Img(goodsList);
		ServletActionContext.getRequest().setAttribute("goodsList", goodsList);
		return "select";
	}
	
	public String show() {
		List<Goods> goodsList = goodsService.show();
		goodsList = base64Img(goodsList);
		ServletActionContext.getRequest().setAttribute("goodsList", goodsList);
		return "show";
	}
	
	public String toModelNo() {
		ServletActionContext.getRequest().setAttribute("goods", goods);
		return "toModelNo";
	}
	
	public String search() {
		List<Goods> goodsList = goodsService.search(goods);
		goodsList = base64Img(goodsList);
		ServletActionContext.getRequest().setAttribute("goodsList", goodsList);
		return "search";
	}
	
	public String color() {
		List<Goods> goodsList = goodsService.color(goods);
		ServletActionContext.getRequest().setAttribute("goodsList", goodsList);
		ServletActionContext.getRequest().setAttribute("rgoods", goodsList.get(0));
		return "color";
	}
	
	public void selectColor() throws Exception{

		List<Goods> list = goodsService.selectColorSize(goods);
		list = base64Img(list);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().println(jsonStr);
	}
	
	public void selectSize() throws Exception{
		List<Goods> list = goodsService.selectSize(goods);
		list = base64Img(list);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().println(jsonStr);
	}
	public List<Goods> base64Img(List<Goods> goodsList){
		String img = null;
		for (Goods goods : goodsList) {
			img = goods.getImg();
			if(img !=null && !"".equals(img)) {
				img ="data:image/jpg;base64," + imgBase.getImgStr(img);
			}
			goods.setImg(img);
		}
		return goodsList;
	}
	
	private Integer currentPage = 1;
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	
	public String listPage() {
		PageBean pageBean = goodsService.listPage(currentPage);
		pageBean.setList(base64Img(pageBean.getList()));
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		return "listPage";
	}
	
	public String page() {
        int pageNum = 1; // 默认显示第几页数据
        if (currentPage != null && !"".equals(currentPage)) {
            pageNum = currentPage;
        }
        int pageSize = 5; // 默认每页显示多少条记录
		Pager<Goods> result = goodsService.findByPage(goods, pageNum, pageSize);
		result.setDataList(base64Img(result.getDataList()));
		ServletActionContext.getRequest().setAttribute("pageBean", result);
		ServletActionContext.getRequest().setAttribute("goods", goods);
		return "page";
	}
}
