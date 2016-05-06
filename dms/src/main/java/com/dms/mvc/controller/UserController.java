package com.dms.mvc.controller;

import java.beans.PropertyEditorSupport;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.mvc.data.entity.DocumentType;
import com.dms.mvc.data.entity.FileType;
import com.dms.mvc.data.entity.Tag;
import com.dms.mvc.data.entity.User;
import com.dms.mvc.data.entity.UserGroup;
import com.dms.mvc.services.interfaces.UserGroupService;
import com.dms.mvc.services.interfaces.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	UserGroupService userGroupService;
	
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
	    binder.registerCustomEditor(UserGroup.class, "groups", new PropertyEditorSupport() {
	    @Override
	    public void setAsText(String text) {
	    	System.out.println(text);
	    	UserGroup ch= null;
	    	try
	    	{
	    		 ch = userGroupService.findById(Long.parseLong(text));
	    	}
	    	catch(NumberFormatException ex)
	    	{
	    		    		
	    	}
	    	if(ch==null)
	        {
	    		ch = userGroupService.findById(1l);
	        }
	        setValue(ch);
	    } 
	    });
    
	}
	
	@RequestMapping(value="/")
	public String goUsers(Model model) {
		
		//System.err.println(userService.getAll());
		model.addAttribute("user", userService.getAll());
		return "pages/user";
	}
	
	@RequestMapping(value="/new/",method=RequestMethod.GET)
	public String userNew(Model model) {
		User user=new User();
		List<UserGroup> groups=userGroupService.getAll();
		model.addAttribute("user", user);
		model.addAttribute("groups", groups);
		return "fragments/forms/frm_user";
	}
	@RequestMapping(value="/new/",method=RequestMethod.POST)
	public String userCreate(Model model,@ModelAttribute("user") User user) {
		userService.save(user);
		model.addAttribute("user", userService.getAll());
		return "fragments/tables/tbl_user";
	}
	
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public String userEdit(Model model,@PathVariable("id") String id) {
		User user=userService.findById(id);
		model.addAttribute("user", user);
		List<UserGroup> groups=userGroupService.getAll();
		model.addAttribute("groups", groups);
		model.addAttribute("edit", true);
		if(!user.getGroups().isEmpty())
		{
			model.addAttribute("selected",user.getGroups().iterator().next().getId());
		}
		return "fragments/forms/frm_user";
	}
	
	@RequestMapping(value="/update/{username}",method=RequestMethod.POST)
	public String userUpdate(Model model,@ModelAttribute("user") User user,@PathVariable("username") String usernmae) {
		userService.userUpdate(user);
		model.addAttribute("user", userService.getAll());
		return "fragments/tables/tbl_user";
	}

	@RequestMapping(value="/delete/{username}",method=RequestMethod.POST)
	public String userDelete(Model model,@PathVariable("username") String username) {

		userService.deleteUser(username);
		model.addAttribute("user", userService.getAll());
		return "fragments/tables/tbl_user";
	}
	
}
