package com.dms.mvc.services.interfaces;

import java.util.List;

import com.dms.mvc.data.entity.Directory;
import com.dms.mvc.data.entity.Document;

public interface DirectoryService {
	public List<Directory> getAllDirectories(); 
	public void createDirectories(Directory directory);
	public Directory getById(long id);
	public Directory updateDirectory(Directory directory);
	public void deleteDirectory(long id);
	public void changeDirectoryLocation(long parentDir,long dir);
	void addDocument(long dir_id, Document doc);
}
