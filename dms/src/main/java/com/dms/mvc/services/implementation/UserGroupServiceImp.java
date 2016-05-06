package com.dms.mvc.services.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.mvc.data.entity.UserGroup;
import com.dms.mvc.data.repositories.UserGroupRepository;
import com.dms.mvc.services.interfaces.UserGroupService;

@Service
public class UserGroupServiceImp implements UserGroupService {

	@Autowired
	UserGroupRepository repo;
	@Override
	public List<UserGroup> getAll() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}
	@Override
	public UserGroup findById(long id) {
		return repo.findOne(id);
	}

}
