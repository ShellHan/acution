package com.acution.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acution.dao.AnnounceDao;
import com.acution.dao.impl.BaseDaoImpl;
import com.acution.entity.Announce;
import com.acution.service.AnnounceService;

@Service("announceService")
public class AnnounceServiceImpl extends BaseDaoImpl implements AnnounceService {

	@Autowired
	private AnnounceDao announceDao;
	public void setAnnounceDao(AnnounceDao announceDao) {
		this.announceDao = announceDao;
	}
	
	@Override
	public List<Announce> getAll() {
		return announceDao.getAll();
	}

	@Override
	public Announce getById(Integer id) {
		return announceDao.getById(id);
	}

	@Override
	public void saveOrUpdate(Announce announce) {
		announceDao.saveOrUpdate(announce);
	}

	@Override
	public void delete(Integer id) {
		announceDao.delete(id);
	}

	@Override
	public List<Announce> listByPage(String pageNumer, String pageSize) {
		return announceDao.listByPage(pageNumer, pageSize);
	}

	@Override
	public int getCount() {
		return announceDao.getCount();
	}

	@Override
	public List<Announce> getAnnPage(String pageNumer) {
		return announceDao.getAnnPage(pageNumer);
	}

	@Override
	public int getAnnCount() {
		return announceDao.getAnnCount();
	}

}
