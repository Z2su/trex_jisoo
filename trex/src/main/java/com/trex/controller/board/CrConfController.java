package com.trex.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.trex.controller.CRSHCalendarData;
import com.trex.dto.CrshVO;
import com.trex.service.CrshService;

@Controller
@RequestMapping("/board/Coronation")
public class CrConfController {
	
	@Autowired
	CrshService crshservice;
	
	
	@ModelAttribute("submenulist")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"대관승인","/board/Coronation/conf/list"});
		
		return submenuList;
		
	}
	
	@RequestMapping(value="/conf/list")
	public ModelAndView listGET(ModelAndView modelnView) {

		return modelnView;
	}
	
	@RequestMapping(value="/conf/listcal",method=RequestMethod.GET)
	@ResponseBody
	public List<CRSHCalendarData> list()throws Exception{
		List<CrshVO> crshList= crshservice.getList();
		
		List<CRSHCalendarData> dataList = new ArrayList<CRSHCalendarData>();
		for(CrshVO crsh : crshList) {
			dataList.add(new CRSHCalendarData(crsh));
		}
		System.out.println(dataList);
		
		return dataList;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
