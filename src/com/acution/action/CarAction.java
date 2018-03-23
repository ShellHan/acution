package com.acution.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.acution.entity.Car;
import com.acution.service.CarService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller("CarAction")
public class CarAction extends ActionSupport implements RequestAware,ModelDriven<Car>,Preparable{

	private static final long serialVersionUID = 1L;

	@Autowired
	private CarService carService;
	
	public void setCarService(CarService carService) {
		this.carService = carService;
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
		
		carService.saveOrUpdate(model);
		return "success";
		
	}
	
	public String delete(){
		
		try {
			carService.delete(id);
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
	
	public String getByUserId(){
		
		request.put("cars", carService.getByUserId(id));
		return "list";
		
	}  
	
	@Override
	public void prepare() throws Exception {}

	public void prepareSave(){
		
		model = new Car();
	
	}
	
	private Car model;
	
	@Override
	public Car getModel() {
		return model;
	}

	private Map<String, Object> request;
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}
