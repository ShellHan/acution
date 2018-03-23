package com.acution.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acution.dao.ManagerDao;
import com.acution.entity.Manager;

@Repository("managerDao")
public class ManagerDaoImpl extends BaseDaoImpl implements ManagerDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Manager> getAll() {
		String hql = "FROM Manager";
		return getSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	public boolean isLogin(String magname, String password) {
		String hql = "FROM Manager m WHERE m.magname= ? and m.password=?";
		List<Manager> managers = getSession().createQuery(hql)
				.setString(0, magname).setString(1, password).list();
		if (managers.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Manager getById(Integer id) {
		return (Manager) getSession().get(Manager.class, id);
	}

	@Override
	public void saveOrUpdate(Manager manager) {
		getSession().saveOrUpdate(manager);
	}    

	@Override
	public void delete(Integer id) {
		String hql = "DELETE FROM Manager m WHERE m.magid = ? ";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}

	@Override
	public int getIdByName(String user) {
		String hql = "SELECT m.magid FROM Manager m where m.magname= ?";
		return (int) getSession().createQuery(hql).setString(0, user).uniqueResult();
	}

}
