package com.trex.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trex.service.PrService;


	
	@Controller
	@RequestMapping("/board")
	public class PrController {
		
		@Autowired
		private PrService prService;
		
		@ModelAttribute("submenuTitle")
		public String submenuTitle() {
			return "홍보게시판";
		}
		@ModelAttribute("submenuList")
		public List<String[]> submenuModel(){
			List<String[]> submenuList = new ArrayList<String[]> ();
			
			submenuList.add(new String[] {"홍보게시판","/board/pr/prlist"});
			submenuList.add(new String[] {"광고게시판","/board/ad/adlist"});
			submenuList.add(new String[] {"이벤트","/board/event/list"});
			
			return submenuList;
		}
		
		@RequestMapping(value="/pr/prlist",method=RequestMethod.GET)
		public void prlistGET() {
			
		}
			
		@RequestMapping(value="/pr/prregist", method=RequestMethod.GET)
		public void prregistGET() {}
		

}
