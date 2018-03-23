package com.acution.dao;

import java.util.List;

import com.acution.entity.User;

public interface UserDao {
	
	public List<User> getAll();
	
	public void saveOrUpdate(User User);
	
	public User getById(Integer id);

	public List<User> listByPage(String pageNumer,String pageSize);
	
	public int getCount();

	public boolean isLogin(String user, String password);

	public boolean isOnlyName(String appname);

	public int getIdByName(String appname);

	public User getByName(String appname);
	
}
