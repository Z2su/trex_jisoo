package com.trex.controller.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.EventVO;
import com.trex.service.EventService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private EventService eService;
	
	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "홍보게시판";
	}
	@ModelAttribute("submenuList")
	public List<String[]> submenuModel(){
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"홍보게시판","prlist"});
		submenuList.add(new String[] {"광고게시판","adlist"});
		submenuList.add(new String[] {"이벤트","/board/event/list"});
		
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
	
	// 이벤트 게시판
	@RequestMapping("/event/list")
	public ModelAndView eventList(ModelAndView modelnView) throws SQLException{
		
		List<EventVO> eventList = eService.eventList();
		
		modelnView.addObject("eventList", eventList);
		
		System.out.println(eventList);
		
		return modelnView;
	}
	
	@RequestMapping(value="/event/detail", method = RequestMethod.GET)
	public ModelAndView detail(int event_num, ModelAndView modelnView) throws SQLException{
		EventVO event = eService.eventDetail(event_num);
		modelnView.addObject("event",event);
		return modelnView;
	}
	
	@RequestMapping(value="/event/regist", method = RequestMethod.GET)
	public void getregist() {}
	
	@RequestMapping(value="/event/regist", method = RequestMethod.POST)
	public String postregist(EventVO event)throws Exception{
		eService.write(event);
		return "redirect:/board/event/list"; 
	   	}
	
	@RequestMapping(value="/event/modify", method = RequestMethod.GET)
	public ModelAndView getmodify(int event_num, ModelAndView modelnView) throws SQLException{
		EventVO event = eService.eventDetail(event_num);
		modelnView.addObject("event",event);
		System.out.println(event);
		return modelnView;
	}
	
	@RequestMapping(value="/event/modify", method = RequestMethod.POST)
	public String postmodify(EventVO event) throws Exception {
		eService.modify(event);
		
		return "redirect:/board/event/list";
	}
	
	@RequestMapping(value="/event/delete")
	public String delete(int event_num, HttpServletResponse response) throws Exception{
		eService.remove(event_num);
		
		return "redirect:/board/event/list";
		
	}
}
