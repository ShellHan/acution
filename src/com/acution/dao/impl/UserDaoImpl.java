package com.acution.dao.impl;

import java.util.List;

import org.junit.Test;
import org.springframework.stereotype.Repository;

import com.acution.dao.UserDao;
import com.acution.entity.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl implements UserDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAll() {
		String hql = "FROM User a ";
		return getSession().createQuery(hql).list();
	}

	@Override
	public void saveOrUpdate(User user) {
		getSession().saveOrUpdate(user);
	}
	
	@Override
	public User getById(Integer id) {
		return (User) getSession().get(User.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listByPage(String pageNumer, String pageSize) {
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
		
	    String hql = "FROM User";
		return getSession().createQuery(hql).setFirstResult(first).setMaxResults(ps).list();
	}

	public int getCount() {
		 String hql = "SELECT count(a) FROM User a";
		 Number number = (Number) getSession().createQuery(hql).uniqueResult();
		 return number.intValue() ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isLogin(String username, String password) {
		String hql = "FROM User a WHERE a.username= ? and a.password= ?";
		List<User> applies = getSession().createQuery(hql)
				.setString(0, username).setString(1, password).list();
		if (applies.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	@Test
	public boolean isOnlyName(String username) {
		System.out.println(username);
		String hql = "SELECT count(a.username) FROM User a WHERE a.username= ?";
		Number number = (Number) getSession().createQuery(hql).setString(0, "username").uniqueResult();
		int count =  number.intValue();
		System.out.println(count);
		 if(count > 0){
			return false;
		 }else {
			return true;
		} 
	}	
	@Override
	public int getIdByName(String username) {
		String hql = "select a.id from User a where a.username= ?";
		Number number = (Number) getSession().createQuery(hql).setString(0, username).uniqueResult();
		return number.intValue();   
	}

	@Override
	public User getByName(String username) {
		
		String hql = "FROM User a WHERE a.username= ?";
		@SuppressWarnings("unchecked")
		List<User> applies =  getSession().createQuery(hql).setString(0, username).list();
		
		if(applies != null && applies.size() > 0 ){
			return applies.get(0);
		}
		
		return null;
	}
	
}
