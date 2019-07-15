package com.trex.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/performrese")
public class PerformController {
	
	@RequestMapping(value="/{pf_code}", method=RequestMethod.GET )
	public ModelAndView performreseGet(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{
		String url = "perform/main";
		
		modelnView.setViewName(url);
		
		return modelnView;
	}
	@RequestMapping("/sample2")
	public String performsesesampleGet() throws SQLException{
		
		String url = "perform/step1";
		return url;
	}
}
