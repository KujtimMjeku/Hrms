package com.dms.mvc.data.entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="file_type")
public class FileType {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	private String type;
	
	private String extensions;
	
	@ManyToMany(mappedBy="fileType")
	private Set<Document> documents;
	
	
	
	public Set<Document> getDocuments() {
		return documents;
	}

	public void setDocuments(Set<Document> documents) {
		this.documents = documents;
	}

	public FileType() {
		this.extensions="";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<String> getExtensions() {
		
		List<String> ext=new ArrayList<>();
		for (String string : Arrays.asList(extensions.split(";"))) {
			ext.add(string.trim());
		}
		return ext;
	}

	public void setExtensions(List<String> extensions) {
		this.extensions = String.join("; ", extensions);
	}

	@Override
	public String toString() {
		return "FileType [id=" + id + ", type=" + type + ", extensions=" + extensions + "]";
	}
	
	
	
}
