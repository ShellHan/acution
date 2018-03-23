package com.acution.action;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.acution.entity.Discuss;
import com.acution.entity.Fileinfo;
import com.acution.service.DiscussService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller("discussAction")
@Scope("prototype")
public class DiscussAction extends ActionSupport implements RequestAware,Preparable, ModelDriven<Discuss> {

	private static final long serialVersionUID = 1L;

	
	@Autowired
	private DiscussService discussService;
	public void setDiscussService(DiscussService discussService) {
		this.discussService = discussService;
	}
	
	private String username;
	public void setUsername(String username) {
		this.username = username;
	}

	private Integer fileid;
	
	public void setFileid(Integer fileid) {
		this.fileid = fileid;
	}
	
	public String save(){
		
		System.out.println(username);
		System.out.println(fileid);
		
		model.setUsername(username);
		model.setDatetime(new Date());
		
		Fileinfo file = new Fileinfo();
		file.setId(fileid);
		model.setFileinfo(file);
		
		discussService.saveOrUpdate(model);
		request.put("msg", "评论成功！ ");
		return "msg";
	}
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	@Override
	public void prepare() throws Exception {}
	
	public void prepareSave(){
		
		model = new Discuss();
	
	}
	
	private Discuss model;
	
	@Override
	public Discuss getModel() {
		return model;
	}
	
	
}
