package com.crms.repository;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.crms.entity.User;
import com.crms.entity.UserGroup;

@Repository
@Transactional
public class UsersRepositoryImp implements UsersRepository {

	
	@PersistenceContext
	private EntityManager em;
	


	
	@Autowired
	private JdbcUserDetailsManager jdbcManager;

	@Override
	@Transactional
	public User findUserNyUsername(String username) {
		User user= em.find(User.class, username);
		return user;
	}

	@Override
	@Transactional
	public void saveUser(User user) {
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		if(!jdbcManager.userExists(user.getUsername()))
		{
			user.setPassword(pwEncoder.encode(user.getPassword()));
			jdbcManager.createGroup("Employee", AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE"));
			em.persist(user);	
			
		}
		jdbcManager.addUserToGroup("kujta", "Employee");
	}
	
	
}
