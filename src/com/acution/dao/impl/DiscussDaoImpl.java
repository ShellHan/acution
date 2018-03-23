package com.acution.dao.impl;

import java.util.List;

import org.junit.Test;
import org.springframework.stereotype.Repository;

import com.acution.dao.DiscussDao;
import com.acution.dao.UserDao;
import com.acution.entity.Discuss;
import com.acution.entity.User;

@Repository("discussDao")
public class DiscussDaoImpl extends BaseDaoImpl implements DiscussDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Discuss> getByfileId(Integer id) {
		String hql = "FROM Discuss d where d.fileinfo.id = ? order by d.datetime desc";
		return getSession().createQuery(hql).setInteger(0, id).list();
	}

	@Override
	public void saveOrUpdate(Discuss discuss) {
		getSession().saveOrUpdate(discuss);
	}
	
}
