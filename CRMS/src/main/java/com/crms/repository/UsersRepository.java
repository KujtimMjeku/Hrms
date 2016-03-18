package com.crms.repository;

import org.springframework.data.repository.CrudRepository;

import com.crms.entity.User;

public interface UsersRepository
{
	User findUserNyUsername(String username);
	void saveUser(User user);
}
