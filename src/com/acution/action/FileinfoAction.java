package com.acution.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.acution.entity.Manager;
import com.acution.entity.User;
import com.acution.entity.Fileinfo;
import com.acution.service.DiscussService;
import com.acution.service.ManagerService;
import com.acution.service.UserService;
import com.acution.service.FileinfoService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.sun.org.apache.xpath.internal.operations.And;

@Controller("fileinfoAction")
@Scope("prototype")
public class FileinfoAction extends ActionSupport implements ModelDriven<Fileinfo>, RequestAware,
		Preparable{
	
	private static final long serialVersionUID = 1L;

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
	
	@Autowired
	private DiscussService discussService;
	public void setDiscussService(DiscussService discussService) {
		this.discussService = discussService;
	}
	
	private Integer magid;
	public void setMagid(Integer magid) {
		this.magid = magid;
	}
	
	private Integer id;
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String save(){
	
		model.setFiledate(new Date());
		
		upload();
		model.setPhotos(fileFileName);
		model.setState("正在拍卖");

		Manager mag = new Manager();
		mag.setMagid(magid);
		model.setMag(mag);
		
		fileinfoService.saveOrUpdate(model);
		
		return "addSuccess";
	}
	
	

	//上传
	private File file;
	private String fileContentType;
	private String fileFileName;

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	public void upload(){
		// 上传
		ServletContext servletContext = ServletActionContext
				.getServletContext();
		String dir = servletContext.getRealPath("/upload/" + fileFileName);
		System.out.println(dir);

		FileOutputStream output = null;
		FileInputStream input = null;
		try {
			output = new FileOutputStream(dir);
			input = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		byte[] buffer = new byte[1024];
		int len = 0;
		
		try {
			while ((len = input.read(buffer)) != -1) {
				output.write(buffer, 0, len);
			}
			output.flush();
			output.close();
			input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String filenumber;
	public void setFilenumber(String filenumber) {
		this.filenumber = filenumber;
	}
	
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String isOnlyNum() throws UnsupportedEncodingException{
		
		System.out.println(filenumber);
		if(fileinfoService.isOnlyNum(filenumber) == true){
			 System.out.println("=======>");
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8")); 
		}else{
			System.out.println("+++++++>");
			   inputStream = new ByteArrayInputStream("0".getBytes("UTF-8")); 
		}
			
		return "ajax-success";
	}

	
	public String delete(){
		try {
			fileinfoService.delete(id);
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
	
	
	
	//分页
		private String pageSize;
		private String pageNumer;

		public void setPageSize(String pageSize) {
			this.pageSize = pageSize;
		}

		public void setPageNumer(String pageNumer) {
			this.pageNumer = pageNumer;
		}
		
		public String listFileinfo() {
			
			System.out.println(pageNumer);
			System.out.println(pageSize);

			List<Fileinfo> fileinfos = fileinfoService.listByPage(pageNumer, pageSize);
			System.out.println(fileinfos);
			
			request.put("fileinfos", fileinfos);
			request.put("count", fileinfoService.getCount());
			request.put("pageNumer", pageNumer);
			request.put("pageSize", pageSize);
			
			return "listFileinfo";
		}
	
		public String inputFileList(){
			
			request.put("fileinfos", fileinfoService.getReadyFiles(pageNumer));
			
			System.out.println(pageNumer);

			int count = fileinfoService.getReadyCount();
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
			
			return "inputFileList";
			
		}
		
		private String select;
		public void setSelect(String select) {
			this.select = select;
		}
		
		public String selectFile(){
			
			System.out.println(select+pageNumer);
			request.put("fileinfos", fileinfoService.selectReadyFiles(select,pageNumer));
			
			int count = fileinfoService.selectReadyCount(select);
			int total = 0;
			// Math.ceil(totalCount / limit);
			if (count % 10 == 0) {
				total = count / 10;
			} else {
				total = count / 10 + 1;
			}
			if(pageNumer == null || Integer.parseInt(pageNumer) == 0){
				request.put("page", 1);
			}else {
				request.put("page", pageNumer);
			}
			request.put("total", total);
			request.put("select", select);
			
			return "inputFileList";
			
		}
		
		
	public String getAllFile(){
		
		System.out.println(pageNumer);
		System.out.println(pageSize);

		List<Fileinfo> fileinfos = fileinfoService.listByPage(pageNumer, pageSize);
		System.out.println(fileinfos);
		
		request.put("fileinfos", fileinfos);
		request.put("count", fileinfoService.getCount());
		request.put("pageNumer", pageNumer);
		request.put("pageSize", pageSize);
		
		return "listAll";
	}
	
	public String getFileById(){
		request.put("fileinfo", fileinfoService.getById(id));
		request.put("discuss", discussService.getByfileId(id));
		return "fileinfo";
	}
	
	private String magname;
	public void setMagname(String magname) {
		this.magname = magname;
	}

	public String findByMagname(){
		request.put("fileinfos", fileinfoService.findByMagname(magname));
		return "indexThree";
	}
	
	//首页显示
	public String inputFile(){
		//最热
		request.put("filehots", fileinfoService.getHot());
		//最新
		request.put("filenews", fileinfoService.getNew());
		
		return "index";
	}
	
		
	@Override
	public void prepare() throws Exception {}
	
	public void prepareSave(){
		
		if(id == null){
			model = new Fileinfo();
		}else{
			model = fileinfoService.getById(id);
		}
	
	}

	private Map<String, Object> request;
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	private Fileinfo model;
	
	@Override
	public Fileinfo getModel() {
		return model;
	}

}
