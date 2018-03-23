package com.acution.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acution.dao.ManagerDao;
import com.acution.entity.Manager;
import com.acution.service.ManagerService;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService{

	
	@Autowired
	private ManagerDao managerDao;
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	
	@Override
	public void saveOrUpdate(Manager manager) {
		managerDao.saveOrUpdate(manager);
	}

	@Override
	public void delete(Integer id) {
		managerDao.delete(id);
	}

	@Override
	public List<Manager> getAll() {
		List<Manager> managers = managerDao.getAll();
		return managers;
	}

	@Override
	public Manager getById(Integer id) {
		Manager manager = managerDao.getById(id);
		return manager;
	}

	@Override
	public boolean isLogin(String magname, String password) {
		return managerDao.isLogin(magname, password);
	}

	@Override
	public int getIdByName(String user) {
		return managerDao.getIdByName(user);
	}

}
