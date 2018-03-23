package com.acution.service;

import java.util.List;

import com.acution.entity.Fileinfo;


public interface FileinfoService {
	
	public List<Fileinfo> getAll();

	public Fileinfo getById(Integer id);
	
	public void saveOrUpdate(Fileinfo fileinfo);
	
	public void delete(Integer id);
	
	
	public List<Fileinfo> listByPage(String pageNumer,String pageSize);
	
	public int getCount();
	

	public List<Fileinfo> getHot();

	public List<Fileinfo> getNew();

	
	public List<Fileinfo> findByMagname(String magname);

	public boolean isOnlyNum(String filenumber);
	
	public List<Fileinfo> getReadyFiles(String pageNumer);
	
	public int getReadyCount();
	
	public List<Fileinfo> selectReadyFiles(String select,String pageNumer);
	
	public int selectReadyCount(String select);
	
}
