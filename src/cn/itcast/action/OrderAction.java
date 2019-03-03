package cn.itcast.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.entity.Area;
import cn.itcast.entity.Category;
import cn.itcast.entity.Goods;
import cn.itcast.entity.Order;
import cn.itcast.entity.ShopCar;
import cn.itcast.entity.User;
import cn.itcast.service.GoodsService;
import cn.itcast.service.OrderService;
import cn.itcast.service.ShopCarService;

@SuppressWarnings("all")
public class OrderAction extends ActionSupport implements ModelDriven<Order>{
	private Img2Base64Util imgBase = new Img2Base64Util();
	private String username =(String) ServletActionContext.getRequest().getSession().getAttribute("username");
	private Order order = new Order();
	public Order getModel() {
		return order;
	}
	@Resource(name="orderService")
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	@Resource(name="goodsService")
	private GoodsService goodsService; 
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	@Resource(name="shopCarService")
	private ShopCarService shopCarService;
	public void setShopCarService(ShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}

	public String toBuy() {
		String oid = ServletActionContext.getRequest().getParameter("oid");
		ShopCar shopCar = shopCarService.findOne(Integer.valueOf(oid));
		ServletActionContext.getRequest().setAttribute("shopCar", shopCar);
		return "toBuy";
	}
	
	public String add() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String province = orderService.getArea(Integer.parseInt(request.getParameter("province"))).getAreaname();
		String city = orderService.getArea(Integer.parseInt(request.getParameter("city"))).getAreaname();
		String county = orderService.getArea(Integer.parseInt(request.getParameter("county"))).getAreaname();
		String detail = request.getParameter("detail");
		order.setAddress(province+city+county+detail);
		orderService.add(order);
		return "add";
	}
	
	public String delete() {
		orderService.delete(order);
		return "delete";
	}
	
	public String show() {
		List<Order> orderList = orderService.findAll();
		base64Img(orderList);
		ServletActionContext.getRequest().setAttribute("orderList", orderList);
		return "show";
	}
	
	public String userOrder() {
		order.setUsername(username);
		List<Order> orderList = orderService.userOrder(order);
		base64Img(orderList);
		ServletActionContext.getRequest().setAttribute("orderList", orderList);
		return "userOrder";
	}
	
	public String toUpdate() {
		order = orderService.findOne(order);
		ServletActionContext.getRequest().setAttribute("order",order);
		return "toUpdate";
	}
	
	public String update() {
		orderService.update(order);
		return "update";
	}
	
	public void address() throws Exception {
		int parentid = Integer.parseInt(ServletActionContext.getRequest().getParameter("parentid")); 
		List<Area> list = orderService.getaddress(parentid);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().println(jsonStr);
	}
	
	public List<Order> base64Img(List<Order> list){
		String img = null;
		for (Order order : list) {
			img = order.getImg();
			if(img !=null && !"".equals(img)) {
				img ="data:image/jpg;base64," + imgBase.getImgStr(img);
			}
			order.setImg(img);
		}
		return list;
	}

}
