package com.dms.mvc.services.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.mvc.data.entity.Tag;
import com.dms.mvc.data.repositories.TagRepository;
import com.dms.mvc.services.interfaces.TagService;

@Service
public class TagServiceImp implements TagService {

	@Autowired
	TagRepository repo;
	@Override
	public List<Tag> getAll() {
		return repo.findAll();
	}
	@Override
	public Tag findById(long id) {
		// TODO Auto-generated method stub
		return repo.findOne(id);
	}
	@Override
	public List<Tag> save(Iterable<Tag> tags) {
		return repo.save(tags);
		
	}
	@Override
	public void deleteTag(long id) {
		repo.delete(id);
	}
	@Override
	public void save(Tag tag) {
		repo.save(tag);
		
	}

}
