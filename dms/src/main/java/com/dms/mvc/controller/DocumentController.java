package com.dms.mvc.controller;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dms.mvc.data.dto.DocumentSearchDto;
import com.dms.mvc.data.entity.Document;
import com.dms.mvc.data.entity.DocumentType;
import com.dms.mvc.data.entity.FileType;
import com.dms.mvc.data.entity.Tag;
import com.dms.mvc.data.repositories.TagRepository;
import com.dms.mvc.services.interfaces.DirectoryService;
import com.dms.mvc.services.interfaces.DocumentService;
import com.dms.mvc.services.interfaces.DocumentTypeService;
import com.dms.mvc.services.interfaces.FileTypeService;
import com.dms.mvc.services.interfaces.TagService;

@Controller
public class DocumentController {

	@Autowired
	DocumentService docService;
	
	@Autowired
	DirectoryService dirService;
	
	@Autowired 
	DocumentTypeService docTypeService;
	
	@Autowired
	FileTypeService fileTypeService;
	
	@Autowired 
	TagService tagService;
	
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
	    binder.registerCustomEditor(Tag.class, "tags", new PropertyEditorSupport() {
	    @Override
	    public void setAsText(String text) {
	    	System.out.println(text);
	    	Tag ch= null;
	    	try
	    	{
	    		 ch = tagService.findById(Long.parseLong(text));
	    	}
	    	catch(NumberFormatException ex)
	    	{
	    		    		
	    	}
	    	if(ch==null)
	        {
	        	ch=new Tag();
	        	ch.setTag(text);
	        }
	        setValue(ch);
	    } 
	    });
	    
	    binder.registerCustomEditor(FileType.class, "fileType", new PropertyEditorSupport() {
		    @Override
		    public void setAsText(String text) {
		    	System.out.println(text);
		    	FileType ch= null;
		    	try
		    	{
		    		 ch = fileTypeService.getById(Long.parseLong(text));
		    	}
		    	catch(NumberFormatException ex)
		    	{
		    		    		
		    	}
		    	if(ch==null)
		        {
		        	ch=new FileType();
		        	ch.setType(text);
		        }
		        setValue(ch);
		    } 
		    });
	    
	    binder.registerCustomEditor(FileType.class, "documentType", new PropertyEditorSupport() {
		    @Override
		    public void setAsText(String text) {
		    	System.out.println(text);
		    	DocumentType ch= null;
		    	try
		    	{
		    		 ch = docTypeService.getById(Long.parseLong(text));
		    	}
		    	catch(NumberFormatException ex)
		    	{
		    		    		
		    	}
		    	if(ch==null)
		        {
		        	ch=new DocumentType();
		        	ch.setDocumentType(text);
		        }
		        setValue(ch);
		    } 
		    });
	
	}
	
	@RequestMapping(value="/document/")
	public String CreateDocument(Model model) {	
		
		List<Document> documents = docService.findDocumentWithOutFolder();
		List<DocumentType> doc_type=docTypeService.getAllDocumentTypes();
		List<Tag> tags=tagService.getAll();
		List<FileType> fileTypes=fileTypeService.getAll();
		model.addAttribute("docs", doc_type);
		model.addAttribute("tags", tags);
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("documents", documents);
		model.addAttribute("sdocument", new DocumentSearchDto());
		return "pages/documents";
	}
	
	@RequestMapping(value="/document/{document}",method=RequestMethod.POST)
	public String delete(Model model,@PathVariable("document") long document_id) {		
		docService.deleteDocument(document_id);
		List<Document> documents = docService.findDocumentWithOutFolder();
		model.addAttribute("documents", documents);
		return "fragments/tables/tbl_documents";
	}

	@RequestMapping(value="/document/new/")
	public String goCreate(Model model) {
		List<DocumentType> doc_type=docTypeService.getAllDocumentTypes();
		List<Tag> tags=tagService.getAll();
		Document doc=new Document();
		model.addAttribute("document", doc);
		model.addAttribute("docs", doc_type);
		model.addAttribute("tags", tags);
		return "pages/create_document";
	}
	
	@RequestMapping(value="/document/new/",method=RequestMethod.POST)
	public String postCreate(Model model, @Validated @ModelAttribute("documnet") Document doc,@RequestParam(name="file") MultipartFile[] files,BindingResult result) {
		System.out.println(doc.getTags());
		docService.createDocument(doc,files[0]);
		System.out.println(doc.getTags());
		System.out.println(files[0].getSize());
		return "redirect:/document/";
	}
	@RequestMapping(value="/document/search/")
	public String search(Model model,@RequestParam("q") String query)
	{
		List<Document> documents = docService.filterDocumentWithOutFolder(query);
		model.addAttribute("documents", documents);
		System.out.println(query);
		return "fragments/tables/tbl_documents";
	}
	
	@RequestMapping(value="/document/asearch/",method=RequestMethod.GET)	
	public String advSearch(Model model,@ModelAttribute("sdocument") DocumentSearchDto sdocument)
	{
		System.out.println(sdocument);
		List<Document> document= new ArrayList<Document>(docService.advanceFilter(sdocument));
		model.addAttribute("documents", document);
		return "fragments/tables/tbl_documents";
	}
	
	@RequestMapping(value = "/document/get/{id}", method = RequestMethod.GET)
	public void getFile(
	    @PathVariable("id") long id, 
	    HttpServletResponse response) {
		Document doc=docService.findById(id);
	    try {
	      // get your file as InputStream
	      response.setContentType(URLConnection.guessContentTypeFromName(doc.getName()));        
	      response.setHeader("Content-Disposition", "inline; filename="+ doc.getName()+";");
	      response.setContentLength(Math.toIntExact(doc.getSize()));
	     
	      InputStream is = docService.readFile(id);
	      org.apache.commons.io.IOUtils.copy(is, response.getOutputStream());
	      
	      response.flushBuffer();
	    } catch (IOException ex) {
	    
	      throw new RuntimeException("IOError writing file to output stream");
	    }

	}
}
