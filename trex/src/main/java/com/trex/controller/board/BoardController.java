package com.trex.controller.board;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dao.EventDAO;
import com.trex.dto.EventVO;
import com.trex.service.EventService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private EventService eService;
	
	@Autowired
	private EventDAO eventDAO;
	
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
	
	
	
	// 이벤트 게시판
	@RequestMapping("/event/list")
	public ModelAndView eventList(ModelAndView modelnView) throws SQLException{
		
		List<EventVO> eventList = eService.eventList();
		
		modelnView.addObject("eventList", eventList);
		
		
		System.out.println("~~"+eventList);
		
		return modelnView;
	}
	@RequestMapping("/event/endlist")
	public ModelAndView eventendList(ModelAndView modelnView) throws SQLException{
		
		List<EventVO> eventEndList = eService.eventEndList();
		
		modelnView.addObject("eventEndList", eventEndList);
		
		System.out.println(eventEndList);
		
		return modelnView;
	}
	
	@RequestMapping(value="/event/detail", method = RequestMethod.GET)
	public ModelAndView detail(int event_num, ModelAndView modelnView) throws SQLException{
		EventVO event = eService.eventDetail(event_num);
		modelnView.addObject("event",event);
		return modelnView;
	}
	
	@RequestMapping(value="/event/regist", method = RequestMethod.GET)
	public void getregist(Model model) throws Exception{
		int event_num = eventDAO.selectEventSeqNext();
		String event_code = "EVE"+ String.format("%04d", event_num);
		
		model.addAttribute("event_num",event_num);
		model.addAttribute("event_code",event_code);
	}
	
	@RequestMapping(value="/event/regist", method = RequestMethod.POST)
	public String postregist(EventVO event )throws Exception{
		System.out.println("event......+"+event);

		eService.write(event);
		return "redirect:/board/event/list"; 
	}
	
	@RequestMapping(value="/event/modify", method = RequestMethod.GET)
	public ModelAndView getmodify(int event_num, String event_code,
							ModelAndView modelnView) throws SQLException{
		EventVO event = eService.eventDetail(event_num);
		
		modelnView.addObject("event",event);
		modelnView.addObject("event_code",event_code);
		
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
	


	@RequestMapping(value="/event/imageUpload",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> imageUpload(HttpServletRequest request,
										  HttpServletResponse response, 
										  MultipartFile uploadFile,
										  String event_code)throws Exception{
		
		 // 이미지 업로드할 경로
		String savePath = request.getServletContext().getRealPath("/resources/event/imageUpload");
		
		File uploadPathFile = new File(savePath);
		
		if(!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}
	    
		String fileFormat=uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf("."));
		String fileName=event_code+fileFormat;
		
		uploadFile.transferTo(new File(savePath+File.separator+fileName));
		
	    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
		String url = request.getContextPath()+"/resources/event/imageUpload/" + fileName ;
		
		Map<String,String> dataMap = new HashMap<String,String>();
		dataMap.put("url", url);
		
		System.out.println(dataMap);
		return dataMap;
		
	}

	
}
