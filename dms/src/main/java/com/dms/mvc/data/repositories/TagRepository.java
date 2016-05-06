package com.dms.mvc.data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dms.mvc.data.entity.Tag;

public interface TagRepository extends JpaRepository<Tag, Long> {

}
