package com.dms.mvc.data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dms.mvc.data.entity.FileType;

public interface FileTypeRepository extends JpaRepository<FileType, Long> {

}
