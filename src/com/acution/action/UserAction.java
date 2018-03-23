package com.acution.action;


import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.acution.entity.User;
import com.acution.service.FileinfoService;
import com.acution.service.ManagerService;
import com.acution.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements RequestAware, ModelDriven<User>,Preparable,ServletRequestAware {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;

	public void setuserService(UserService userService) {
		this.userService = userService;
	}
	
	@Autowired
	private FileinfoService fileinfoService;
	public void setFileinfoService(FileinfoService fileinfoService) {
		this.fileinfoService = fileinfoService;
	}
	
	@Autowired
	private ManagerService managerService;
	
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	private String username;
	public void setUsername(String username) {
		this.username = username;
	}
	
		//分页
		private String pageSize;
		private String pageNumer;

		public void setPageSize(String pageSize) {
			this.pageSize = pageSize;
		}

		public void setPageNumer(String pageNumer) {
			this.pageNumer = pageNumer;
		}
		
		public String listUsers() {
			
			System.out.println(pageNumer);
			System.out.println(pageSize);
			
			request.put("user", userService.listByPage(pageNumer, pageSize));
			request.put("count", userService.getCount());
			request.put("pageNumer", pageNumer);
			request.put("pageSize", pageSize);
			
			return "listusers";
		}
	
	//判断用户名是否唯一
	public String isOnlyName() throws UnsupportedEncodingException{
		
		if(userService.isOnlyName(username) == true){
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
				System.out.println("0");
		}else{
			   inputStream = new ByteArrayInputStream("0".getBytes("UTF-8")); 
			   System.out.println("1");
		}
			
		return "ajax-success";
	}


	public String getById(){
		request.put("user",userService.getById(id));
		return "addApprove";
	}
	
	public String getInfoByName(){
		request.put("user",userService.getByName(username));
		return "getInfoByName";
	}
	
	public String getByName(){
		request.put("user",userService.getByName(username));
		return "userinfo";
	}
	
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	private String email;
	public void setEmail(String email) {
		this.email = email;
	}
	private String password;
	public void setPassword(String password) {
		this.password = password;
	}
	private String phone;
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String update(){
		User model = userService.getById(id);
		model.setUsername(username);
		model.setEmail(email);
		model.setPassword(password);
		model.setPhone(phone);
		model.setDatetime(new Date());
		userService.saveOrUpdate(model);
		//销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "update";
	}
	
	public String regist(){
		
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		System.out.println(checkcode1);
		System.out.println(checkcode);
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			request.put("login", "验证码输入错误！");
			return "checkcodeFail";
		}
		
		model.setDatetime(new Date());
		
		userService.saveOrUpdate(model);
		request.put("msg", "注册成功请登录！ ");
		return "msg";
	}
	
	//登录
	private String radio;
	public void setRadio(String radio) {
		this.radio = radio;
	}
	
	public String isLogin(){
		
		System.out.println(radio);
		
		if(radio.equals("")){
			request.put("login", "登录失败,请确认登录信息");
	    	return "login-fail";
		}else {
			if(radio.equals("用户")){
				
				boolean isLoginApp = isLoginUser();
				
				if(isLoginApp){				
					
					req.getSession().setAttribute("username", username);
					//最热
					request.put("filehots", fileinfoService.getHot());
					//最新
					request.put("filenews", fileinfoService.getNew());
					
					return "userlogin-success";
				}else{
					request.put("login", "登录失败,请确认登录信息");
					return "login-fail";
				}
			}else if(radio.equals("管理员")){
				boolean isLoginMag = isLoginMag();
				System.out.println(isLoginMag);
				if(isLoginMag){
					int id = managerService.getIdByName(username);
					
					req.getSession().setAttribute("magname", username);
					req.getSession().setAttribute("id", id);
					
					return "maglogin-success";
				}else {
					request.put("login", "登录失败,请确认登录信息");
					return "login-fail";
				}
			}else {
				request.put("login", "登录失败,请确认登录信息");
				return "login-fail";
			}

		}
		
	}
	
	//管理员登录
	public boolean isLoginMag(){
		boolean isloginMag = managerService.isLogin(username, password);
		return isloginMag;
	}
	//用户登录
	public boolean isLoginUser(){
		boolean isLoginUser = userService.isLogin(username, password);
		return isLoginUser;
	}
	
	//退出
	public String logout(){
		//销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "logout";
	}
	
	private Integer id;

	public void setId(Integer id) {
		this.id = id;
	}

	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	private HttpServletRequest req; 
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	private User model;

	@Override
	public User getModel() {
		return model;
	}

	@Override
	public void prepare() throws Exception {}
	
	public void prepareSave(){
		
		if(id == null){
			model = new User();
		}else{
			model = userService.getById(id);
		}
	
	}
	
	public void prepareRegist(){
		
			model = new User();
	}
	
	public void prepareActive(){
		
		model = new User();
	}
	
	
	
}
