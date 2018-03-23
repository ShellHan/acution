package com.acution.dao;

import java.util.List;

import com.acution.entity.Manager;

public interface ManagerDao {

	public List<Manager> getAll();
	
	public Manager getById(Integer id);
	
	public void saveOrUpdate(Manager manager);
	
	public void delete(Integer id);
	
	public boolean isLogin(String magname, String password);

	public int getIdByName(String user);
	
}
