package com.acution.dao;

import java.util.List;

import com.acution.entity.Car;

public interface CarDao {
	
	public List<Car> getByUserId(Integer id);
	
	public void saveOrUpdate(Car car);
	
	public void delete(Integer id);

	
}
