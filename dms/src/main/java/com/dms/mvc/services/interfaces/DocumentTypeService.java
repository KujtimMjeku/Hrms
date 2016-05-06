package com.dms.mvc.services.interfaces;

import java.util.List;

import com.dms.mvc.data.entity.DocumentType;

public interface DocumentTypeService {
	List<DocumentType> getAllDocumentTypes();
	DocumentType getById(long id);
}
