package com.acution.service;

import java.util.List;

import com.acution.entity.User;

public interface UserService {
	
	public void saveOrUpdate(User user);
	
	public List<User> getAll();

	public User getById(Integer id);

	public List<User> listByPage(String pageNumer, String pageSize);

	public int getCount();
	
	public boolean isLogin(String user, String password);

	public boolean isOnlyName(String username);

	public int getIdByName(String username);

	public User getByName(String username);

	
}
