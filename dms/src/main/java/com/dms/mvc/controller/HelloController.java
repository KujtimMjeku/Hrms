package com.dms.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.mvc.data.entity.Directory;
import com.dms.mvc.services.interfaces.DirectoryService;

@Controller
public class HelloController {

	@Autowired
	DirectoryService directoryService;
	
	@RequestMapping("/")
	public String goHome()
	{

		//System.out.println(directoryService.getById(3));
		List<Directory> dirList= directoryService.getAllDirectories();
		System.out.println(dirList);
		return "pages/home";
	}
}
