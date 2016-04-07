package com.dms.mvc.services.interfaces;

import java.util.List;

import com.dms.mvc.data.entity.Directory;

public interface DirectoryService {
	public List<Directory> getAllDirectories(); 
	public void createDirectories(Directory directory);
	public Directory getById(long id);
}
