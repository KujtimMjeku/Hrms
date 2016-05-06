package com.dms.mvc.services.implementation;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.mvc.data.entity.Directory;
import com.dms.mvc.data.entity.Document;
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
	@Transactional
	public Directory getById(long id) {
		Directory dir = directoryRepo.findOne(id);
		Hibernate.initialize(dir.getDocuments());
		return dir;
	}

	@Override
	@Transactional
	public Directory updateDirectory(Directory directory) {
		return directoryRepo.save(directory);
	}

	@Override
	@Transactional
	public void deleteDirectory(long id) {
		directoryRepo.delete(id);
	}

	@Override
	@Transactional
	public void changeDirectoryLocation(long parentDir, long dir) {

		Directory parent = directoryRepo.findOne(dir);
		Directory chlid = directoryRepo.findOne(parentDir);
		chlid.setParent(parent);
		updateDirectory(chlid);
	}

	@Override
	@Transactional
	public void addDocument(long dir_id, Document doc) {
		Directory dir;
		if (dir_id == 0) {
			 dir= getById(1l);
			 System.out.println(dir);
		}
		else
		{
			dir= getById(dir_id);
		}
		dir.getDocuments().add(doc);
		System.out.println(dir.getDocuments());
		updateDirectory(dir);

	}

}
