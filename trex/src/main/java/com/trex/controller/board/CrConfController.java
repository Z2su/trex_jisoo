package com.trex.controller.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.CrAppVO;
import com.trex.dto.CrConfVO;
import com.trex.service.CrConfService;

@Controller
@RequestMapping("/board/Coronation")
public class CrConfController {
	
	
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
