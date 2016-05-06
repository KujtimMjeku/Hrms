package com.dms.mvc.services.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.mvc.data.entity.FileType;
import com.dms.mvc.data.repositories.FileTypeRepository;
import com.dms.mvc.services.interfaces.FileTypeService;

@Service
public class FileTypeServiceImp implements FileTypeService {

	@Autowired
	FileTypeRepository repo;
	
	@Override
	public List<FileType> getAll() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	public FileType getFileTypeFromExtension(String extension) {
		System.out.println(extension);
		List<FileType> fileTypes=getAll();
		for (FileType fileType : fileTypes) {
			if(fileType.getExtensions().contains(extension))
				return fileType;
		}
		return null;
		
	}

	@Override
	public void deleteFileType(long id) {
		repo.delete(id);
		
	}

	@Override
	public FileType getById(long id) {
		return repo.findOne(id);
	}

	@Override
	public void save(FileType fileType) {
		repo.save(fileType);
		
	}
	

}
