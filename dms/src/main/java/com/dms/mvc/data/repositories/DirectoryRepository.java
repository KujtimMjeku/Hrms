package com.dms.mvc.data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dms.mvc.data.entity.Directory;

public interface DirectoryRepository extends JpaRepository<Directory, Long> {

}
