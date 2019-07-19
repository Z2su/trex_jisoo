package com.trex.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.PFSHViewVO;
import com.trex.dto.PerformGuidBoardVO;
import com.trex.service.PerformReservationService;

@Controller
@RequestMapping("/performrese")
public class PerformReservationController {
	
	@Autowired
	private PerformReservationService PFRESEService;
	
	
	@RequestMapping(value="/{pf_code}", method=RequestMethod.GET )
	public ModelAndView performreseGet(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{
		String url = "perform/main";
		
		modelnView.addObject("pf_code", pf_code);
		modelnView.setViewName(url);
		
		
		return modelnView;
	}
	@RequestMapping(value="/sample2/{pf_code}")
	public ModelAndView performsesesampleGet(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{
		
		String url = "perform/step1";
		
		System.out.println("gㅎㅎㅎㅎㅎ>>"+pf_code);
		
		List<PFSHViewVO> PFSHViewList = PFRESEService.getPFSHViewList(pf_code);
		System.out.println("zzzzzz>>"+PFSHViewList);
		
		modelnView.addObject("PFSHViewList", PFSHViewList);
		modelnView.setViewName(url);
		return modelnView;
	}
	
	@ResponseBody
	@RequestMapping(value="pfsh", method=RequestMethod.GET)
	public PFSHViewVO pfshsearch(String pfsh_code){
		

		PFSHViewVO PFSHView=null;
		System.out.println("starttime???"+pfsh_code);
		
		try {
			PFSHView = PFRESEService.getPFSHView(pfsh_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return PFSHView;
	}
}
