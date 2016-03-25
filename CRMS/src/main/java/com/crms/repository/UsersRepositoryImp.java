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

import com.crms.dto.UserDto;
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

	@Override
	@Transactional
	public List<User> findAllUsers() {
		return em.createQuery("Select t from User t").getResultList();
	}

	@Override
	@Transactional
	public Set<UserGroup> findAllGroups() {
		return new HashSet<UserGroup>(em.createQuery("Select t from UserGroup t").getResultList());
	}

	@Override
	@Transactional
	public User updateUser(UserDto user) 
	{
		User usr =findUserNyUsername(user.getUsername());
		usr.setName(user.getName());
		usr.setSurename(user.getSurename());
		usr.setAddress(user.getAddress());
		usr.setEmail(user.getEmail());
		usr.setTelephone(user.getTelephone());
		usr.setBirthDay(user.getBirthDay());
		Set<UserGroup> ug=new HashSet<>();
		for (Integer groupId : user.getGroups()) {
			ug.add(findUserGroupById(groupId));
		}
		usr.setGroups(ug);
		
		em.persist(usr);
		for (UserGroup userGroup : usr.getGroups()) {
			System.out.println(userGroup.getName());
		}
		
		return usr;
	}
	@Override
	@Transactional
	public UserGroup findUserGroupById(Integer id) {
		return em.find(UserGroup.class, id);
	}
	
	
}
