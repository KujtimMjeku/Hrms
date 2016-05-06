package com.dms.mvc.data.dto;
import java.util.Set;

import com.dms.mvc.data.entity.FileType;
import com.dms.mvc.data.entity.Tag;

public class DocumentSearchDto {
	private String name;
	private String title;
	private int documentType;
	private Set<Tag> tags;
	private String date;
	private FileType fileType;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getDocumentType() {
		return documentType;
	}
	public void setDocumentType(int documentType) {
		this.documentType = documentType;
	}
	public Set<Tag> getTags() {
		return tags;
	}
	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public FileType getFileType() {
		return fileType;
	}
	public void setFileType(FileType fileType) {
		this.fileType = fileType;
	}
	

	@Override
	public String toString() {
		return "DocumentSearchDto [name=" + name + ", title=" + title + ", documentType=" + documentType + ", tags="
				+ tags + ", date=" + date + ", fileType=" + fileType + "]";
	}
}
