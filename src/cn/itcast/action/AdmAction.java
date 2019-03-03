package cn.itcast.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.entity.Adm;
import cn.itcast.service.AdmService;

@SuppressWarnings("all")
public class AdmAction extends ActionSupport implements ModelDriven<Adm>{
	private Adm adm = new Adm();
	public Adm getModel() {
		return adm;
	}
	private AdmService admService;
	@Resource(name="admService")
	public void setAdmService(AdmService admService) {
		this.admService = admService;
	}
	
	public String toLogin() {
		return "toLogin";
	}
	
	public String login() {
		Adm admExit = admService.login(adm);
		if(admExit != null) {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().setAttribute("admin", admExit.getName());;
			return "loginSuccess";
		}else {
			return "login";
		}
	}

	public String logout() {
		ServletActionContext.getRequest().getSession().setAttribute("admin", null);
		return "logout";
	}
}
