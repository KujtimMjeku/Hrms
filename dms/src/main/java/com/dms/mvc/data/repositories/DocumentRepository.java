package com.dms.mvc.data.repositories;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.dms.mvc.data.entity.Document;
import com.dms.mvc.data.entity.DocumentType;
import com.dms.mvc.data.entity.FileType;

public interface DocumentRepository extends JpaRepository<Document, Long> {
	
	
	List<Document> findByDirectoryIsNullAndDeletedFalseOrderByNameAsc();
	
	@Query("select d from Document d where (d.directory is null and d.deleted=0) and (d.name like %:name% or d.title like %:title%)")
	List<Document> findByDirectoryIsNullAndDeletedFalseAndNameLikeAndTitleLike(@Param("name") String name, 
																			   @Param("title") String title);
	
	@Query("select d from Document d where"
			+ " (d.directory is null and d.deleted=0) and "
			+ "(d.name like %:name% or d.title like %:title%) and "
			+ "(d.doc_type = :documentType ) and"
			+ "(d.fileType = :fileType) and "
			+ "(d.relaseDate between :dateStart and :dateEnd)")
	Set<Document> advaneFilter(@Param("name") String name, 
								@Param("title") String title,
								@Param("documentType") DocumentType documentTypeId,
								@Param("fileType") FileType fileTypeId,
								@Param("dateStart") Date startDate,
								@Param("dateEnd") Date endDate);
}
