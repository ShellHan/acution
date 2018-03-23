package com.acution.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acution.dao.AnnounceDao;
import com.acution.dao.CarDao;
import com.acution.dao.impl.BaseDaoImpl;
import com.acution.entity.Announce;
import com.acution.entity.Car;
import com.acution.service.AnnounceService;
import com.acution.service.CarService;

@Service("carService")
public class CarServiceImpl extends BaseDaoImpl implements CarService {

	@Autowired
	private CarDao carDao;
	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}
	
	@Override
	public List<Car> getByUserId(Integer id) {
		return carDao.getByUserId(id);
	}

	@Override
	public void saveOrUpdate(Car car) {
		carDao.saveOrUpdate(car);
	}

	@Override
	public void delete(Integer id) {
		carDao.delete(id);
	}


}
