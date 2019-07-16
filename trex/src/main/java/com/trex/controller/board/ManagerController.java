package com.trex.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@RequestMapping(value="/list")
	public void listGET() {
	}
	
	@RequestMapping(value="/list2")
	public void list2GET() {
	}
	
	@RequestMapping(value="/list3")
	public void list3GET() {
	}
	
	@RequestMapping(value="/list4")
	public void list4GET() {
	}
	
	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "관리자!!";
	}
	@ModelAttribute("submenuList")
	public List<String[]> submenuModel(){
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"정보보기","list"});
		submenuList.add(new String[] {"직원관리","list2"});
		submenuList.add(new String[] {"관리자관리자","list3"});
		submenuList.add(new String[] {"캘린더 관리","list4"});
		
		return submenuList;
	}


}
