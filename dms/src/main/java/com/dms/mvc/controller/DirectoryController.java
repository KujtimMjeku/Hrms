package com.dms.mvc.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dms.mvc.data.entity.Directory;
import com.dms.mvc.services.interfaces.DirectoryService;

/**
 * @author Kujtim Mjeku
 *
 */
@Controller
public class DirectoryController {

	@Autowired
	DirectoryService directoryService;
	
	
	
	/**
	 * @param model , 
	 * @param dir_id, id of directory which we want to open
	 * @param modal , parameter that tells if function is called with ajax call 
	 * @return, return directories page or reidirect to directory move
	 */
	@RequestMapping(value="/directory/")
	public String getInDirectory(Model model,@RequestParam("dir") long dir_id,
			@RequestParam(value="modal",defaultValue="false") boolean modal)
	{
		
		if(modal)
		{
			return "redirect:/directory/move/?dir="+dir_id;
		}		
		Directory directory=directoryService.getById(dir_id);
		System.out.println(directory.getDocuments());
		model.addAttribute("directory", directory);
		model.addAttribute("parentDirs", getParentDirectories(directory));
		//System.out.println(getParentDirectories(directory));
		
		return "pages/directories";
	}
	
	/**
	 * @param model
	 * @param dir_id , this parameter indicates directory where we want to create new directory
	 * @return       , return form for creating directory
	 */
	@RequestMapping(value="/directory/new/")
	public String goNewDirectory(Model model,@RequestParam("dir") long dir_id) {
	
		model.addAttribute("dir_id", dir_id);
		return "fragments/forms/frm_directory";
	}
	
	/**
	 * @param model
	 * 
	 * @param dir_id this parameter indicates directory which we want to edit
	 * @return return form for editing directory
	 */
	@RequestMapping(value="/directory/edit/")
	public String goEditDirectory(Model model,@RequestParam("dir") long dir_id) {
		
		Directory dir=directoryService.getById(dir_id);
		model.addAttribute("dir_id", dir_id);
		model.addAttribute("dir_name", dir.getName());
		model.addAttribute("edit", true);
		return "fragments/forms/frm_directory";
	}
	
	/**
	 * @param model
	 * @param modal parameter that tells if function is called with ajax call 
	 * @param dir_id 
	 * @param dirname
	 * @return
	 */
	@RequestMapping(value="/directory/create/",method=RequestMethod.POST)
	public String goCreateDirectory(Model model,
			@RequestParam(value="modal",defaultValue="false") boolean modal,
			@RequestParam("dir") long dir_id,
			@RequestParam("dirname") String dirname) {
	
		Directory dir=new Directory();
		dir.setName(dirname);
		dir.setParent(directoryService.getById(dir_id));
		directoryService.createDirectories(dir);
		if(modal)
		{
			return "redirect:/directory/move/?dir="+dir.getId();
		}
		else
		{
			return "redirect:/directory/?dir="+dir_id;
		}
	}
	
	@RequestMapping(value="/directory/update/",method=RequestMethod.POST)
	public String goUpdateDirectory(Model model, @RequestParam("dir") long dir_id, @RequestParam("dirname") String dirname) {
	
		Directory dir=directoryService.getById(dir_id);
		dir.setName(dirname);
		directoryService.updateDirectory(dir);
		return "redirect:/directory/?dir="+dir.getParent().getId();
	}
	
	@RequestMapping(value="/directory/delete/",method=RequestMethod.POST)
	public String goDeleteDirectory(Model model,@RequestParam("dir") long dir_id) {
		System.err.println("Delte dir id: "+ dir_id);
		Directory dir=directoryService.getById(dir_id);
		long parent_id=dir.getParent().getId();
		directoryService.deleteDirectory(dir_id);
		return "redirect:/directory/?dir="+parent_id;
	}
	

	@RequestMapping(value="/directory/move/",method=RequestMethod.GET)
	public String goMoveDirectory(Model model,@RequestParam("dir") long dir_id,
			@RequestParam(value="modal",defaultValue="false") boolean modal) {
		System.err.println("Move dir id: "+ dir_id);
		Directory directory=directoryService.getById(dir_id);
		if(modal)
		{
			System.err.println("test,test");
			model.addAttribute("directory", directory);
			model.addAttribute("parentDirs", getParentDirectories(directory));
		}
		else
		{
			model.addAttribute("directory", directory.getParent());
			model.addAttribute("parentDirs", getParentDirectories(directory.getParent()));
		}
	
		return "pages/move_folder";
	}
	@RequestMapping(value="/directory/move/",method=RequestMethod.POST)
	public String MoveDirectory(@RequestParam("dir_p") long dirp_id,@RequestParam("dir") long dir_id,RedirectAttributes redirect) {
		directoryService.changeDirectoryLocation(dirp_id, dir_id);
		redirect.addFlashAttribute("move_sussess", true);
		return "redirect:/directory/?dir="+dir_id;
	}
	
	public List<Directory> getParentDirectories(Directory dir) {
		
		List<Directory> parentDirs=new ArrayList<>();
		Directory  pDir=dir;
		while (pDir.getParent()!=null) {
			parentDirs.add(pDir.getParent());
			pDir=pDir.getParent();
		}
		Collections.reverse(parentDirs); 
		return parentDirs;
		
	}
	
}
