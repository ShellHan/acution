package com.acution.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acution.dao.AnnounceDao;
import com.acution.dao.CarDao;
import com.acution.entity.Announce;
import com.acution.entity.Car;

@Repository("carDao")
public class CarDaoImpl extends BaseDaoImpl implements CarDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Car> getByUserId(Integer id) {
		String hql = "From Car c where c.user.userid = ?";
		return getSession().createQuery(hql).setInteger(0, id).list();
	}

	@Override
	public void saveOrUpdate(Car car) {
		getSession().saveOrUpdate(car);
	}

	@Override
	public void delete(Integer id) {
		String hql = "DELETE FROM Car c WHERE c.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}

}
