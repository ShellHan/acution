package com.acution.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acution.dao.UserDao;
import com.acution.entity.User;
import com.acution.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public void saveOrUpdate(User user) {
		userDao.saveOrUpdate(user);
	}

	@Override
	public List<User> getAll() {
		List<User> Users = userDao.getAll();
		return Users;
	}

	@Override
	public User getById(Integer id) {
	User User = userDao.getById(id);
		return User;
	}

	@Override
	public List<User> listByPage(String pageNumer, String pageSize) {
		// TODO Auto-generated method stub
		return userDao.listByPage(pageNumer, pageSize);
	}

	@Override
	public boolean isLogin(String username, String password) {
		return userDao.isLogin(username, password);
	}

	@Override
	public boolean isOnlyName(String username) {
		return userDao.isOnlyName(username);
	}
	@Override
	public int getCount() {
		return userDao.getCount();
	}

	@Override
	public int getIdByName(String username) {
		return userDao.getIdByName(username);
	}

	@Override
	public User getByName(String username) {
		return userDao.getByName(username);
	}

}
