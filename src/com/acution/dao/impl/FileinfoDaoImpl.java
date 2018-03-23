package com.acution.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acution.dao.FileinfoDao;
import com.acution.entity.Fileinfo;

@Repository("fileinfoDao")
public class FileinfoDaoImpl extends BaseDaoImpl implements FileinfoDao{

	@Override
	public void delete(Integer id) {
		String hql = "DELETE FROM Fileinfo f WHERE f.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Fileinfo> getAll() {
		String hql = "FROM Fileinfo f";
		return getSession().createQuery(hql).list();
	}

	@Override
	public void saveOrUpdate(Fileinfo fileinfo) {
		getSession().saveOrUpdate(fileinfo);
	}
	
	@Override
	public Fileinfo getById(Integer id) {
		return (Fileinfo) getSession().get(Fileinfo.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Fileinfo> listByPage(String pageNumer, String pageSize) {
		int pn = 1;
		int ps = 10;
		int first = 0;
		if(pageNumer != null){
			pn = Integer.parseInt(pageNumer);
		}
		if(pageSize != null){
			ps = Integer.parseInt(pageSize);
		}
		first = ps*(pn-1);
		
	    String hql = "FROM Fileinfo f";
		return getSession().createQuery(hql).setFirstResult(first).setMaxResults(ps).list();
	}

	public int getCount() {
		 String hql = "SELECT count(f) FROM Fileinfo f ";
		 Number number = (Number) getSession().createQuery(hql).uniqueResult();
		 return number.intValue() ;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Fileinfo> getHot() {
		String hql = "FROM Fileinfo f WHERE f.state = '正在拍卖' and f.ishot = 1 ";
		return getSession().createQuery(hql).list().subList(0,2);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Fileinfo> getNew() {
		String hql = "FROM Fileinfo f where f.state = '正在拍卖'order by f.filedate desc ";
		return getSession().createQuery(hql).list().subList(0,2);
	}
	
	@Override
	public List<Fileinfo> findByMagname(String magname) {
		
		String hql = "FROM Fileinfo f where f.mag.magname = ? order by f.id ";
		return getSession().createQuery(hql).setString(0, magname).list();
		
	}

	@Override
	public boolean isOnlyNum(String filenumber) {
		
		String hql = "SELECT count(f) FROM Fileinfo f WHERE f.filenumber= ?";
		Number number = (Number) getSession().createQuery(hql).setString(0,filenumber).uniqueResult();
		int count =  number.intValue();
		 if(count > 0){
			return false;
		 }else {
			return true;
		}
	}
	
	@Override
	public List<Fileinfo> getReadyFiles(String pageNumer) {
		
		int pn = 1;
		int ps = 6;
		int first = 0;
		
		if(pageNumer != null){
			pn = Integer.parseInt(pageNumer);
		}

		first = ps*(pn-1);
		
		String hql = "FROM  Fileinfo f where f.state = '正在拍卖' order by f.id ";
		return getSession().createQuery(hql).setFirstResult(first).setMaxResults(ps).list();
	}
	
	@Override
	public int getReadyCount() {
		String hql = "SELECT count(f) FROM Fileinfo f where f.state = '正在拍卖' ";
		 Number number = (Number) getSession().createQuery(hql).uniqueResult();
		 return number.intValue() ;
	}
	
	@Override
	public List<Fileinfo> selectReadyFiles(String select,String pageNumer) {
		
		int pn = 1;
		int ps = 6;
		int first = 0;
		
		if(pageNumer != null && Integer.parseInt(pageNumer) > 1){
			pn = Integer.parseInt(pageNumer);
		}

		first = ps*(pn-1);
		
		String hql = "FROM  Fileinfo f where f.title like :select1 or f.type like :select2 and f.state = '正在拍卖' order by f.id ";
		return getSession().createQuery(hql).setString("select1", "%"+select+"%").setString("select2", "%"+select+"%").setFirstResult(first).setMaxResults(ps).list();
	}
	
	@Override
	public int selectReadyCount(String select) {
		String hql = "SELECT count(f) FROM Fileinfo f where f.title like :select1 or f.type like :select2 and f.state = '正在拍卖'";
		 Number number = (Number) getSession().createQuery(hql).setString("select1", "%"+select+"%").setString("select2", "%"+select+"%").uniqueResult();
		 return number.intValue() ;
	}
	
}
