package com.acution.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acution.dao.AnnounceDao;
import com.acution.entity.Announce;

@Repository("announceDao")
public class AnnounceDaoImpl extends BaseDaoImpl implements AnnounceDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Announce> getAll() {
		String hql = "From Announce";
		return getSession().createQuery(hql).list();
	}

	@Override
	public Announce getById(Integer id) {
		return (Announce) getSession().get(Announce.class, id);
	}

	@Override
	public void saveOrUpdate(Announce announce) {
		getSession().saveOrUpdate(announce);
	}

	@Override
	public void delete(Integer id) {
		String hql = "DELETE FROM Announce a WHERE a.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}

	@Override
	public List<Announce> listByPage(String pageNumer, String pageSize) {
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
		
	    String hql = "FROM Announce";
		return getSession().createQuery(hql).setFirstResult(first).setMaxResults(ps).list();
	}

	@Override
	public int getCount() {
		 String hql = "SELECT count(a) FROM Announce a";
		 Number number = (Number) getSession().createQuery(hql).uniqueResult();
		 return number.intValue() ;
	}

	@Override
	public List<Announce> getAnnPage(String pageNumer) {
		int pn = 1;
		int ps = 10;
		int first = 0;
		
		if(pageNumer != null){
			pn = Integer.parseInt(pageNumer);
		}

		first = ps*(pn-1);
		
		String hql = "FROM Announce a  order by a.annDate ";
		return getSession().createQuery(hql).setFirstResult(first).setMaxResults(ps).list();
	}

	@Override
	public int getAnnCount() {
		String hql = "SELECT count(a) FROM Announce a ";
		Number number = (Number) getSession().createQuery(hql).uniqueResult();
		return number.intValue() ;
	}

}
