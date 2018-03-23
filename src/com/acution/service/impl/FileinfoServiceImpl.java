package com.acution.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acution.dao.FileinfoDao;
import com.acution.entity.Fileinfo;
import com.acution.service.FileinfoService;

@Service("fileinfoService")
public class FileinfoServiceImpl implements FileinfoService {

	@Autowired
	private FileinfoDao fileinfoDao;
	public void setFileinfoDao(FileinfoDao fileinfoDao) {
		this.fileinfoDao = fileinfoDao;
	}
	
	@Override
	public List<Fileinfo> getAll() {
		return fileinfoDao.getAll();
	}

	@Override
	public Fileinfo getById(Integer id) {
		return fileinfoDao.getById(id);
	}

	@Override
	public void saveOrUpdate(Fileinfo fileinfo) {
		fileinfoDao.saveOrUpdate(fileinfo);
	}

	@Override
	public void delete(Integer id) {
		fileinfoDao.delete(id);
	}

	@Override
	public List<Fileinfo> listByPage(String pageNumer, String pageSize) {
		return fileinfoDao.listByPage(pageNumer, pageSize);
	}

	@Override
	public int getCount() {
		return fileinfoDao.getCount();
	}

	@Override
	public List<Fileinfo> getHot() {
		return fileinfoDao.getHot();
	}

	@Override
	public List<Fileinfo> getNew() {
		return fileinfoDao.getNew();
	}

	
	@Override
	public List<Fileinfo> findByMagname(String magname) {
		return fileinfoDao.findByMagname(magname);
	}

	@Override
	public boolean isOnlyNum(String filenumber) {
		return fileinfoDao.isOnlyNum(filenumber);
	}
	
	@Override
	public List<Fileinfo> getReadyFiles(String pageNumer) {
		return fileinfoDao.getReadyFiles(pageNumer);
	}

	@Override
	public int getReadyCount() {
		return fileinfoDao.getReadyCount();
	}
	
	@Override
	public List<Fileinfo> selectReadyFiles(String select,String pageNumer) {
		return fileinfoDao.selectReadyFiles(select,pageNumer);
	}

	@Override
	public int selectReadyCount(String select) {
		return fileinfoDao.selectReadyCount(select);
	}

}
