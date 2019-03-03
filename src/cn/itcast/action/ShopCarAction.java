package cn.itcast.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.entity.Goods;
import cn.itcast.entity.ShopCar;
import cn.itcast.entity.User;
import cn.itcast.service.ShopCarService;

@SuppressWarnings("all")
public class ShopCarAction extends ActionSupport implements ModelDriven<ShopCar>{
	private Img2Base64Util imgBase = new Img2Base64Util();
	private String username =(String) ServletActionContext.getRequest().getSession().getAttribute("username");
	private ShopCar shopCar = new ShopCar();
	public ShopCar getModel() {
		return shopCar;
	}
	@Resource(name="shopCarService")
	private ShopCarService shopCarService;
	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}
	
	public String list() {
		List<ShopCar> list = shopCarService.findAll();
		base64Img(list);
		ServletActionContext.getRequest().setAttribute("shopCarList", list);
		return "list";
	}
	
	public String user() {
		shopCar.setUsername(username);
		List<ShopCar> list = shopCarService.userShopCar(shopCar);
		base64Img(list);
		ServletActionContext.getRequest().setAttribute("shopCarList", list);
		return "user";
	}
	
	public String deleteShopCar() {
	 	shopCar = shopCarService.findOne(shopCar.getId());
		shopCarService.delete(shopCar);
		return "deleteShopCar";
	}
	
	public String inc() {
	 	shopCar = shopCarService.findOne(shopCar.getId());
		int quantity = shopCar.getQuantity()+1;
		double amount = shopCar.getPrice()*quantity;
		shopCar.setQuantity(quantity);
		shopCar.setAmount(amount);
		shopCarService.update(shopCar);
		return "inc";
	}
	
	public String dec() {
		int quantity = 1;
	 	shopCar = shopCarService.findOne(shopCar.getId());
	 	if(shopCar.getQuantity()>1) {
	 		quantity = shopCar.getQuantity()-1;
	 	}
		double amount = shopCar.getPrice()*quantity;
		shopCar.setQuantity(quantity);
		shopCar.setAmount(amount);
		shopCarService.update(shopCar);
		return "dec";
	}
	
	public String add() {
		String img = shopCarService.findImg(shopCar);
		shopCar.setImg(img);
		shopCarService.add(shopCar);
		return "add";
	}
	
	public List<ShopCar> base64Img(List<ShopCar> list){
		String img = null;
		for (ShopCar shopCar : list) {
			img = shopCar.getImg();
			if(img !=null && !"".equals(img)) {
				img ="data:image/jpg;base64," + imgBase.getImgStr(img);
			}
			shopCar.setImg(img);
		}
		return list;
	}
	
	public void userList() throws Exception {
		shopCar.setUsername(username);
		List<ShopCar> list = shopCarService.userShopCar(shopCar);
		base64Img(list);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().println(jsonStr);
	}
}
