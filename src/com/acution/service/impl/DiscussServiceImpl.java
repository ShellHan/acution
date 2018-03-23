package com.acution.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acution.dao.DiscussDao;
import com.acution.entity.Discuss;
import com.acution.service.DiscussService;

@Service("discussService")
public class DiscussServiceImpl implements DiscussService{
	
	@Autowired
	private DiscussDao discussDao;

	public void setDiscussDao(DiscussDao discussDao) {
		this.discussDao = discussDao;
	}

	@Override
	public List<Discuss> getByfileId(Integer id) {
		return discussDao.getByfileId(id);
	}

	@Override
	public void saveOrUpdate(Discuss discuss) {
		discussDao.saveOrUpdate(discuss);
	}
	

}
