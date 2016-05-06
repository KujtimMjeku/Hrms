package com.dms.mvc.data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dms.mvc.data.entity.Document;
import com.dms.mvc.data.entity.DocumentType;

public interface DocumentTypeRepository extends JpaRepository<DocumentType, Long> {

}
