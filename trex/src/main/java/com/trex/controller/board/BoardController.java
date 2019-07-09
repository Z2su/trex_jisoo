package com.trex.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "홍보게시판";
	}
	@ModelAttribute("submenuList")
	public List<String[]> submenuModel(){
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"홍보게시판","prlist"});
		submenuList.add(new String[] {"광고게시판","adlist"});
		submenuList.add(new String[] {"이벤트","slist"});
		
		return submenuList;
	}
	
	@RequestMapping(value="/pr/prlist",method=RequestMethod.GET)
	public void prlistGET() {
		
	}
	@RequestMapping(value="/pr/adlist",method=RequestMethod.GET)
	public void adlistGET() {
		
	}
	@RequestMapping(value="/pr/prregist", method=RequestMethod.GET)
	public void prregistGET() {}
	
	@RequestMapping(value="/pr/adregist", method=RequestMethod.GET)
	public void adregistGET() {}
	
	@RequestMapping(value="/pr/slist",method=RequestMethod.GET)
	public void listGET() {
		
	}
	@RequestMapping(value="/pr/elist",method=RequestMethod.GET)
	public void reseGET() {
		
	}


}
