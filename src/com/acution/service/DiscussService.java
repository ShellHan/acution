package com.acution.service;

import java.util.List;

import com.acution.entity.Discuss;
import com.acution.entity.User;

public interface DiscussService {
	
	public List<Discuss> getByfileId(Integer id);
	
	public void saveOrUpdate(Discuss discuss);
	
}
