package com.dms.mvc.services.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.mvc.data.entity.DocumentType;
import com.dms.mvc.data.repositories.DocumentTypeRepository;
import com.dms.mvc.services.interfaces.DocumentTypeService;

@Service
public class DocumentTypeServiceImp implements DocumentTypeService {

	@Autowired
	DocumentTypeRepository repo;
	
	@Override
	public List<DocumentType> getAllDocumentTypes() {
		return repo.findAll();
	}

	@Override
	public DocumentType getById(long id) {
		return repo.getOne(id);
	}

}
