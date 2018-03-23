package com.acution.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.acution.entity.Announce;
import com.acution.service.AnnounceService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller("announceAction")
public class AnnounceAction extends ActionSupport implements RequestAware,ModelDriven<Announce>,Preparable{

	private static final long serialVersionUID = 1L;

	@Autowired
	private AnnounceService announceService;
	
	public void setAnnounceService(AnnounceService announceService) {
		this.announceService = announceService;
	}
	
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	private Integer id;
	public void setId(Integer id) {
		this.id = id;
	}

	public String save(){
		
		model.setAnnDate(new Date());
		announceService.saveOrUpdate(model);
		return "success";
		
	}
	
	public String getById(){
		
		request.put("announce", announceService.getById(id));
		return "input";
	}
	
	public String getAnnById(){
		request.put("announce", announceService.getById(id));
		return "inputAnn";
	}
	
	public String delete(){
		
		try {
			announceService.delete(id);
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
	
	public String listAll(){
		
		request.put("announces", announceService.getAll());
		return "list";
		
	}  
	
	// ��ѯ�ӷ�ҳ
		private String pageSize;
		private String pageNumer;

		public void setPageSize(String pageSize) {
			this.pageSize = pageSize;
		}

		public void setPageNumer(String pageNumer) {
			this.pageNumer = pageNumer;
		}
		
		public String listAnns() {
			
			System.out.println(pageNumer);
			System.out.println(pageSize);
			
			request.put("announces", announceService.listByPage(pageNumer, pageSize));
			request.put("count", announceService.getCount());
			request.put("pageNumer", pageNumer);
			request.put("pageSize", pageSize);
			
			return "listAnns";
		}
		
		public String listAnnsTwo(){
			
			//��ѯ���ͨ��ķ���
			request.put("announces", announceService.getAnnPage(pageNumer));
			
			System.out.println(pageNumer);

			int count = announceService.getAnnCount();
			int total = 0;
			// Math.ceil(totalCount / limit);
			if (count % 10 == 0) {
				total = count / 10;
			} else {
				total = count / 10 + 1;
			}
			if(pageNumer == null){
				request.put("page", 1);
			}else {
				request.put("page", pageNumer);
			}
			
			request.put("total", total);
			
			return "listAnnsTwo";
			
		}
	
	@Override
	public void prepare() throws Exception {}

	public void prepareSave(){
		
		if(id == null){
			model = new Announce();
		}else{
			model = announceService.getById(id);
		}
	
	}
	
	private Announce model;
	
	@Override
	public Announce getModel() {
		return model;
	}

	private Map<String, Object> request;
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}
