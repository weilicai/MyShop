package cn.itcast.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.entity.User;
import cn.itcast.service.UserService;

@SuppressWarnings("all")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	private User user = new User();
	public User getModel() {
		return user;
	}
	@Resource(name="userService")
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String login() {
		
		user = userService.login(user);
		if(user != null) {
			ServletActionContext.getRequest().getSession().setAttribute("username", user.getUserName());
			return "loginSuccess";
		}
		return "login";
	}
	
	public String tologin() {
		return "tologin";
	}
	public String toRegister() {
		return "toRegister";
	}
	
	public String register() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String rePassword = (String) request.getParameter("rePassword");
		if(rePassword.equals(user.getPassword()) && !(user.getUserName()).equals("") && !(user.getPassword()).equals("")) {
			userService.add(user);
			return "registerSuccess";
		}
		return "register";
	}
	
	public String logout() {
		ServletActionContext.getRequest().getSession().setAttribute("username", null);
		return "logout";
	}
}
