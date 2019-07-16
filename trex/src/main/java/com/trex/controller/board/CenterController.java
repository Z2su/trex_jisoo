package com.trex.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/center")
public class CenterController {
	
	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "고객센터";
	}
//	@ModelAttribute("submenuList")
//	public List<String[]> submenuModel(){
//		List<String[]> submenuList = new ArrayList<String[]> ();
//		
//		submenuList.add(new String[] {"공지사항","notice/list"});
//		submenuList.add(new String[] {"FAQ","faq/list"});
//		submenuList.add(new String[] {"QNA","qna/list"});
//
//		
//		return submenuList;
//	}
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String mainGET() {
		return "/board/center/notice/list";
	}
	
	/*@RequestMapping(value="/notice/list",method=RequestMethod.GET)
	public void noticeGET() {

	}*/

	

}
