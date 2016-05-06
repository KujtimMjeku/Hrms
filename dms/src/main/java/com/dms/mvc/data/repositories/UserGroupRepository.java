package com.dms.mvc.data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dms.mvc.data.entity.UserGroup;

public interface UserGroupRepository extends JpaRepository<UserGroup, Long> {

}
