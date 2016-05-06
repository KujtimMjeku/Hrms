package com.dms.mvc.data.entity;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.beans.factory.annotation.Autowired;


@Entity
@Table(name = "documents")
public class Document {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private String title;
	private String description;
	private boolean published;
	private boolean archived;
	private boolean deleted;
	private long size;

	@Column(name = "storeage_name")
	private String storeageName;

	@Column(name = "imediate_release_doc")
	private boolean imediatlyReleaseDocument;

	@Column(name = "release_date")
	@Temporal(TemporalType.DATE)
	private Date relaseDate;
	
	@Column(name = "created_on", updatable=false,insertable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdOn;
	
	@Column(name = "updated_on",insertable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedOn;
	

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "document_type")
	private DocumentType doc_type;

	@ManyToOne(cascade = CascadeType.PERSIST, targetEntity = Directory.class)
	@JoinColumn(name = "p_directory")
	private Directory directory;

	@ManyToOne(cascade = CascadeType.PERSIST, targetEntity = FileType.class)
	@JoinColumn(name = "file_type")
	private FileType fileType;

	@ManyToMany( cascade={CascadeType.MERGE}, fetch = FetchType.EAGER)
	@JoinTable(name = "document_tags", 
			joinColumns = @JoinColumn(name = "document_id", referencedColumnName = "id") , 
			inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "id") )
	private Set<Tag> tags;

	
	
	
	
	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	public FileType getFileType() {
		return fileType;
	}

	public void setFileType(FileType fileType) {
		this.fileType = fileType;
	}

	public Directory getDirectory() {
		return directory;
	}

	public void setDirectory(Directory directory) {
		this.directory = directory;
	}

	public DocumentType getDoc_type() {
		return doc_type;
	}

	public void setDoc_type(DocumentType doc_type) {
		this.doc_type = doc_type;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isPublished() {
		return published;
	}

	public void setPublished(boolean published) {
		this.published = published;
	}

	public boolean isArchived() {
		return archived;
	}

	public void setArchived(boolean archived) {
		this.archived = archived;
	}

	public boolean isImediatlyReleaseDocument() {
		return imediatlyReleaseDocument;
	}

	public void setImediatlyReleaseDocument(boolean imediatlyReleaseDocument) {
		this.imediatlyReleaseDocument = imediatlyReleaseDocument;
	}

	public Date getRelaseDate() {
		return relaseDate;
	}

	public void setRelaseDate(Date relaseDate) {
		this.relaseDate = relaseDate;
	}

	public String getStoreageName() {
		return storeageName;
	}

	public void setStoreageName(String storeageName) {
		this.storeageName = storeageName;
	}

	public static String readableFileSize(long size) {
	    if(size <= 0) return "0";
	    final String[] units = new String[] { "B", "KB", "MB", "GB", "TB" };
	    int digitGroups = (int) (Math.log10(size)/Math.log10(1024));
	    return new DecimalFormat("#,##0").format(size/Math.pow(1024, digitGroups)) + " " + units[digitGroups];
	}
	
	@Override
	public String toString() {
		return "Document [id=" + id + ", name=" + name + ", title=" + title + ", description=" + description
				+ ", published=" + published + ", archived=" + archived + ", imediatlyReleaseDocument="
				+ imediatlyReleaseDocument + ", relaseDate=" + relaseDate + ", deleted=" + deleted + "]";
	}

}
