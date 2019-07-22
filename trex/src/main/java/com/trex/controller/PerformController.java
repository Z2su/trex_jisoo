package com.trex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/performrese")
public class PerformController {
	/*
	@RequestMapping(value="/{pf_code}", method=RequestMethod.GET )
	public ModelAndView performreseGet(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{
		String url = "perform/main";
		
		
		
		modelnView.addObject("pf_code", pf_code);
		modelnView.setViewName(url);
		
		
		return modelnView;
	}
	@RequestMapping("/sample2")
	public String performsesesampleGet() throws SQLException{
		
		String url = "perform/step1";
		return url;
	}*/
}
