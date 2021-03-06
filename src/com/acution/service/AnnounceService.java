package com.acution.service;

import java.util.List;

import com.acution.entity.Announce;

public interface AnnounceService {
	
	public List<Announce> getAll();
	
	public Announce getById(Integer id);
	
	public void saveOrUpdate(Announce announce);
	
	public void delete(Integer id);
	
	public List<Announce> listByPage(String pageNumer,String pageSize);
	
	public int getCount();
	
	public List<Announce> getAnnPage(String pageNumer);
	
	public int getAnnCount();
	
}
