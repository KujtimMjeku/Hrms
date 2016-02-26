package com.crms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.crms.entity.CarType;

@Controller
@RequestMapping(value="car") 
public class CarController {
	
	@RequestMapping(value="/", method = RequestMethod.GET) 
	public String goHome() {		
		return "pages/car";
	}
	
	@RequestMapping(value="/go", method = RequestMethod.GET) 
	public String goHom1e() {		
		return "pages/car";
	}
	
}
