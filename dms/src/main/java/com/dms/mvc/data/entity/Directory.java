package com.dms.mvc.data.entity;

import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="directories")
public class Directory {

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@ManyToOne(targetEntity=Directory.class)
	@JoinColumn(name="parent")
    private Directory parent;
	
	@OneToMany(targetEntity=Directory.class,mappedBy="parent",cascade={CascadeType.REMOVE},fetch=FetchType.EAGER)
    private List<Directory> children;
    
    private String name;
    
    @OneToMany(mappedBy="directory")
    private List<Document> documents;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Directory getParent() {
		return parent;
	}

	public void setParent(Directory parent) {
		this.parent = parent;
	}

	public List<Directory> getChildren() {
		return children;
	}

	public void setChildren(List<Directory> children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public List<Document> getDocuments() {
		return documents;
	}

	public void setDocuments(List<Document> documents) {
		this.documents = documents;
	}

	@Override
	public String toString() {
		return "Directory [id=" + id + ", name=" + name + "]";
	} 
	
}
