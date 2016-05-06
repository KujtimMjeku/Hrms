package com.dms.mvc.services.interfaces;

import java.io.InputStream;
import java.util.List;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.web.multipart.MultipartFile;

import com.dms.mvc.data.dto.DocumentSearchDto;
import com.dms.mvc.data.entity.Document;

public interface DocumentService {
	void createDocument(Document documnet,MultipartFile file);
	InputStream readFile(long doc_id);
	List<Document> findDocumentWithOutFolder();
	List<Document> filterDocumentWithOutFolder(String query);
	Set<Document> advanceFilter(DocumentSearchDto document);
	void deleteDocument(long id);
	Document findById(long id);
}
