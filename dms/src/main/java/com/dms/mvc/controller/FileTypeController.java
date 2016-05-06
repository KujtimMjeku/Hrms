package com.dms.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.mvc.data.entity.FileType;
import com.dms.mvc.data.entity.Tag;
import com.dms.mvc.services.interfaces.FileTypeService;
import com.dms.mvc.services.interfaces.TagService;

@Controller
public class FileTypeController {

	@Autowired
	FileTypeService fileTypeService;
	
	@Autowired
	TagService tagService;
	
	@RequestMapping("/filetype/")
	public String getFTypes(Model model) {
		List<FileType> fileTypes=fileTypeService.getAll();
		List<Tag> tags=tagService.getAll();
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("tags", tags);
		return "pages/file_types";
	}
	
	@RequestMapping(value="/tag/delete/{id}",method=RequestMethod.POST)
	public String tagDelete(Model model,@PathVariable("id") long id) {
		System.out.println(id);
		tagService.deleteTag(id);
		List<FileType> fileTypes=fileTypeService.getAll();
		List<Tag> tags=tagService.getAll();
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("tags", tags);
		return "fragments/tables/tbl_filetypes";
	}
	
	@RequestMapping(value="/tag/new/",method=RequestMethod.GET)
	public String tagNew(Model model) {
		Tag tag=new Tag();
		model.addAttribute("tag", tag);
		return "fragments/forms/frm_tag";
	}
	
	@RequestMapping(value="/tag/edit/{id}",method=RequestMethod.GET)
	public String tagEdit(Model model,@PathVariable("id") long id) {
		Tag tag=tagService.findById(id);
		model.addAttribute("tag", tag);
		model.addAttribute("edit", true);
		return "fragments/forms/frm_tag";
	}
	
	@RequestMapping(value="/tag/update/{id}",method=RequestMethod.POST)
	public String tagUpdate(Model model,@PathVariable("id") long id,@ModelAttribute("tag") Tag tag) {
	
		tagService.save(tag);
		List<FileType> fileTypes=fileTypeService.getAll();
		List<Tag> tags=tagService.getAll();
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("tags", tags);
		return "fragments/tables/tbl_filetypes";
	}
	@RequestMapping(value="/tag/create/",method=RequestMethod.POST)
	public String tagCreate(Model model,@ModelAttribute("tag") Tag tag) {	
		tagService.save(tag);
		List<FileType> fileTypes=fileTypeService.getAll();
		List<Tag> tags=tagService.getAll();
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("tags", tags);
		return "fragments/tables/tbl_filetypes";
	}
	
	
	@RequestMapping(value="/filetypes/delete/{id}",method=RequestMethod.GET)
	public String filetypeDelete(Model model,@PathVariable("id") long id) {
		System.out.println(id);
		fileTypeService.deleteFileType(id);
		List<FileType> fileTypes=fileTypeService.getAll();
		List<Tag> tags=tagService.getAll();
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("tags", tags);
		return "fragments/tables/tbl_filetypes";
	}
	@RequestMapping(value="/filetype/edit/{id}",method=RequestMethod.GET)
	public String fileTypeEdit(Model model,@PathVariable("id") long id) {
		FileType filetype=fileTypeService.getById(id);
		model.addAttribute("filetype", filetype);
		model.addAttribute("edit", true);
		return "fragments/forms/frm_filetype";
	}
	@RequestMapping(value="/filetype/update/{id}",method=RequestMethod.POST)
	public String fileTypeUpdate(Model model,@PathVariable("id") long id,@ModelAttribute("filetype") FileType filetype) {
	
		fileTypeService.save(filetype);
		List<FileType> fileTypes=fileTypeService.getAll();
		List<Tag> tags=tagService.getAll();
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("tags", tags);
		return "fragments/tables/tbl_filetypes";
	}
	
	@RequestMapping(value="/filetype/new/",method=RequestMethod.GET)
	public String fileTypeNew(Model model) {
		FileType filetype=new FileType();
		model.addAttribute("filetype", filetype);
		return "fragments/forms/frm_filetype";
	}
	
	@RequestMapping(value="/filetype/create/",method=RequestMethod.POST)
	public String fileTypeCreate(Model model,@ModelAttribute("filetype") FileType filetype) {	
		fileTypeService.save(filetype);
		List<FileType> fileTypes=fileTypeService.getAll();
		List<Tag> tags=tagService.getAll();
		model.addAttribute("filetypes", fileTypes);
		model.addAttribute("tags", tags);
		return "fragments/tables/tbl_filetypes";
	}

}
