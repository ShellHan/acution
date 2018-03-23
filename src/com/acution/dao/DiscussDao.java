package com.acution.dao;

import java.util.List;

import com.acution.entity.Discuss;



public interface DiscussDao {
	
	public List<Discuss> getByfileId(Integer id);
	
	public void saveOrUpdate(Discuss discuss);
	
}
