package com.dms.mvc.services.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.mvc.data.entity.User;
import com.dms.mvc.data.repositories.UserRepository;
import com.dms.mvc.services.interfaces.UserService;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	UserRepository repo;
	
	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	@Transactional
	public void save(User user) {
		user.setPassword("test");
		repo.save(user);
		
	}

	@Override
	public User findById(String id) {
		return repo.findOne(id);
	}

	@Override
	@Transactional
	public User userUpdate(User user) {
		System.err.println(user);
		User use=findById(user.getUsername());
		user.setPassword(use.getPassword());
		return repo.save(user);
	}

	@Override
	public void deleteUser(String username) {
		repo.delete(username);
	}

	
}
