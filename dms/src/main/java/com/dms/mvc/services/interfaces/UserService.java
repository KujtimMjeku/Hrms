package com.dms.mvc.services.interfaces;

import java.util.List;

import com.dms.mvc.data.entity.User;



public interface UserService {
	List<User> getAll();
	void save(User user);
	User findById(String id);
	User userUpdate(User user);
	void deleteUser(String username);
}
