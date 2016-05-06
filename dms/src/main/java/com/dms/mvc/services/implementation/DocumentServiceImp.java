package com.dms.mvc.services.implementation;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.dms.mvc.data.dto.DocumentSearchDto;
import com.dms.mvc.data.entity.Directory;
import com.dms.mvc.data.entity.Document;
import com.dms.mvc.data.entity.DocumentType;
import com.dms.mvc.data.entity.FileType;
import com.dms.mvc.data.entity.Tag;
import com.dms.mvc.data.repositories.DirectoryRepository;
import com.dms.mvc.data.repositories.DocumentRepository;
import com.dms.mvc.data.repositories.TagRepository;
import com.dms.mvc.services.interfaces.DirectoryService;
import com.dms.mvc.services.interfaces.DocumentService;
import com.dms.mvc.services.interfaces.DocumentTypeService;
import com.dms.mvc.services.interfaces.FileTypeService;
import com.dms.mvc.services.interfaces.TagService;

@Service
@PropertySource(value={"classpath:application.properties"})
public class DocumentServiceImp implements DocumentService {

	@Autowired
	DocumentRepository repo;
	
	@Autowired
	DirectoryService dirService;
	
	@Autowired
	DocumentTypeService docTypeService;
	
	@Autowired 
	FileTypeService fileTypeService;
	
	@Autowired 
	TagService tagService;
	
	@Autowired
	private Environment environment;
	
	@Override
	@Transactional
	public void createDocument(Document documnet,MultipartFile file) 
	{
		DocumentType docType=docTypeService.getById(documnet.getDoc_type().getId());
		documnet.setDoc_type(docType);
		UUID uuid=UUID.randomUUID();
		int dot = file.getOriginalFilename().lastIndexOf(".");
		String extension=file.getOriginalFilename().substring(dot);
		String filename=uuid.toString()+extension;
		FileType fileType=fileTypeService.getFileTypeFromExtension(extension);
		
		List<Tag> newTags = documnet.getTags().stream().filter(t -> t.getId() == 0).collect(Collectors.toList());
		newTags = tagService.save(newTags);
		System.err.println(documnet.getTags());
		if(fileType!=null)
		{
			documnet.setFileType(fileType);
			System.out.println(fileType);
		}
		documnet.setStoreageName(filename);
		documnet.setName(file.getOriginalFilename());
		BufferedOutputStream stream;
		try {
			stream = new BufferedOutputStream(
					new FileOutputStream(new File(environment.getProperty("root.storage.directory") + "/" + filename)));
		FileCopyUtils.copy(file.getInputStream(), stream);
				stream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		documnet.setUpdatedOn(new Date());
		documnet.setSize(file.getSize());
		repo.save(documnet);
	
	}

	@Override
	public InputStream readFile(long doc_id) {
		InputStream is=null;
		Document doc= repo.findOne(doc_id);
		try {
			is=new FileInputStream(environment.getProperty("root.storage.directory")+"/"+doc.getStoreageName());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return is;
	}

	@Override
	public List<Document> findDocumentWithOutFolder() {

		List<Document> doc=repo.findByDirectoryIsNullAndDeletedFalseOrderByNameAsc();
		return doc;
	}

	@Override
	@Transactional
	public void deleteDocument(long id) {
		Document document=repo.findOne(id);
		document.setArchived(true);
		document.setDeleted(true);
		repo.save(document);
	}

	@Override
	public List<Document> filterDocumentWithOutFolder(String query) {
		List<Document> doc=repo.findByDirectoryIsNullAndDeletedFalseAndNameLikeAndTitleLike(query, query);
		return doc;
	}

	@Override
	public Document findById(long id) {
		return repo.findOne(id);
	}

	@Override
	public Set<Document> advanceFilter(DocumentSearchDto document) {
		String[] dates=document.getDate().split("-");
		Set<Document> documents=repo.advaneFilter(
				document.getName(),
				document.getTitle(),
				docTypeService.getById(document.getDocumentType()),
				document.getFileType(),
				new Date(dates[0]), 
				new Date(dates[1]));
		return documents;
	}

}
