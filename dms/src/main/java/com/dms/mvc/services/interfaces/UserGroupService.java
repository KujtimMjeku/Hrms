package com.dms.mvc.services.interfaces;

import java.util.List;

import com.dms.mvc.data.entity.UserGroup;

public interface  UserGroupService {

	List<UserGroup> getAll();
	UserGroup findById(long id);
}
