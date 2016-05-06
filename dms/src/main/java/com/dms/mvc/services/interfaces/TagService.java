package com.dms.mvc.services.interfaces;

import java.util.List;

import com.dms.mvc.data.entity.Tag;

public interface TagService {
	List<Tag> getAll();
	Tag findById(long id);
	List<Tag> save(Iterable<Tag> tags);
	void deleteTag(long id);
	void save(Tag tag);
}
