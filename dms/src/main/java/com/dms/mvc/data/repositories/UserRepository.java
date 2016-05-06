package com.dms.mvc.data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dms.mvc.data.entity.User;

public interface UserRepository extends JpaRepository<User, String> {

}
