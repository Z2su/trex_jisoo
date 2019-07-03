package com.trex.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/perform")
public class PerformController {
	
	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "공연안내";
	}
	@ModelAttribute("submenuList")
	public List<String[]> submenuModel(){
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"공연안내","list"});
		submenuList.add(new String[] {"공연예매안내","rese"});
		submenuList.add(new String[] {"기타공연소식","gg"});
		submenuList.add(new String[] {"공연정보신청","gg"});
		
		return submenuList;
	}
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void listGET() {
		
	}
	@RequestMapping(value="/rese",method=RequestMethod.GET)
	public void reseGET() {
		
	}


}
