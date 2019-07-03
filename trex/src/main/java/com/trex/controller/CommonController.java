package com.trex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String mainGET() {
		return "main";
	}
	@RequestMapping(value="/board",method=RequestMethod.GET)
	public String boardGET() {
		return "/board/boardmain";
	}
	
	
	

}
