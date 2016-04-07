package com.dms.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.mvc.data.entity.Directory;
import com.dms.mvc.services.interfaces.DirectoryService;

@Controller
public class DirectoryController {

	@Autowired
	DirectoryService directoryService;
	
	@RequestMapping(value="/directory/")
	public String getInDirectory(Model model,@RequestParam("dir") long dir_id) {
		
		Directory directory=directoryService.getById(dir_id);
		model.addAttribute("directory", directory);
		return "pages/directories";
	}
	
	@RequestMapping(value="/directory/new/")
	public String goNewDirectory(Model model,@RequestParam("dir") long dir_id) {
	
		model.addAttribute("dir_id", dir_id);
		return "fragments/forms/frm_directory";
	}
	
	@RequestMapping(value="/directory/create/",method=RequestMethod.POST)
	public String goCreateDirectory(Model model,@RequestParam("dir") long dir_id,@RequestParam("dirname") String dirname) {
	
		Directory dir=new Directory();
		dir.setName(dirname);
		dir.setParent(directoryService.getById(dir_id));
		directoryService.createDirectories(dir);
		return "redirect:/directory/?dir="+dir_id;
	}
}
