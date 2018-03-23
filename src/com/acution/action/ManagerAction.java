package com.acution.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.acution.entity.Manager;
import com.acution.service.UserService;
import com.acution.service.ManagerService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller("managerAction")
@Scope("prototype")
public class ManagerAction extends ActionSupport implements RequestAware,Preparable, ModelDriven<Manager> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ManagerService managerService;
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	@Autowired
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
/*	@Autowired
	private FileinfoService fileinfoService;
	public void setFileinfoService(FileinfoService fileinfoService) {
		this.fileinfoService = fileinfoService;
	}*/
	
	private Integer id;
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String save(){
		managerService.saveOrUpdate(model);
		return "addsuccess";
	}
	
	//修改密码	
	private String newpassword;
	
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	
	public String updatePwd(){
		
		model = managerService.getById(id);
		model.setPassword(newpassword);
		request.put("msg", "修改成功");
		
		managerService.saveOrUpdate(model);
		return "updatePaw-success";
		
	}
	
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String delete(){

		try {
			managerService.delete(id);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "ajax-success";
	}
	
	public String input(){
		request.put("manager", managerService.getById(id));
		return "input";
	}
	
	public String listManager(){
		request.put("managers", managerService.getAll());
		return "list";
	}
	
	@Override
	public void prepare() throws Exception {}
	
	public void prepareSave(){
		
		if(id == null){
			model = new Manager();
		}else{
			model = managerService.getById(id);
		}
	
	}
	
	private Manager model;
	
	@Override
	public Manager getModel() {
		return model;
	}
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}
