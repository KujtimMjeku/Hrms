package com.dms.mvc.services.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.mvc.data.entity.Directory;
import com.dms.mvc.data.repositories.DirectoryRepository;
import com.dms.mvc.services.interfaces.DirectoryService;

@Service
public class DirectoryServiceImp implements DirectoryService {

	@Autowired
	DirectoryRepository directoryRepo;
	@Override
	public List<Directory> getAllDirectories() {
		// TODO Auto-generated method stub
		return directoryRepo.findAll();
	}
	@Override
	@Transactional
	public void createDirectories(Directory directory) {
		directoryRepo.save(directory);
	}
	@Override
	public Directory getById(long id) {
		return directoryRepo.findOne(id);
	}

}
