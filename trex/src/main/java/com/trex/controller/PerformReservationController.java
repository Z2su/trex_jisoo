package com.trex.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.PFSHViewVO;
import com.trex.dto.PerformReservationVO;
import com.trex.dto.SeatReqVO;
import com.trex.service.PerformReservationService;

@Controller
@RequestMapping("/performrese")
public class PerformReservationController {
	
	@Autowired
	private PerformReservationService PFRESEService;
	
	@RequestMapping(value="/{pf_code}/step1", method=RequestMethod.GET )
	public ModelAndView performreseGet(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{


		String url = "perform/step1";
		List<PFSHViewVO> PFSHViewList = PFRESEService.getPFSHViewList(pf_code);
		modelnView.addObject("PFSHViewList", PFSHViewList);
		modelnView.addObject("pf_code", pf_code);
		modelnView.setViewName(url);
		
		
		return modelnView;
	}
	
	@RequestMapping(value="/pay/{pf_code}", method=RequestMethod.GET )
	public ModelAndView performPay(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{

		String url = "perform/main4";

		modelnView.addObject("pf_code", pf_code);
		modelnView.setViewName(url);
		
		return modelnView;
	}

	/*

	

	@RequestMapping(value="/sample2/{pf_code}")
	public ModelAndView performsesesampleGet(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{
		
		String url = "perform/step1";
		
		
		
		List<PFSHViewVO> PFSHViewList = PFRESEService.getPFSHViewList(pf_code);
		
		
		modelnView.addObject("PFSHViewList", PFSHViewList);
		modelnView.setViewName(url);
		return modelnView;
	}*/
	
	@ResponseBody
	@RequestMapping(value="pfsh", method=RequestMethod.POST)
	public List<PFSHViewVO> pfshsearch(String rundate, String pf_code) throws SQLException{
		
		
		List<PFSHViewVO> PFSHViewList = PFRESEService.getPFSHViewListByDate(rundate, pf_code);

		return PFSHViewList;
	}
	@ResponseBody
	@RequestMapping(value="pfsh1", method=RequestMethod.POST)
	public List<SeatReqVO> seatcount(String pfsh_code) throws SQLException{
		
		
		List<SeatReqVO> SeatReq = PFRESEService.getSeatCount(pfsh_code);
		String[] background = {"#7C68EE", "#1CA814", "#17B3FF","#FB7E4F","#A0D53F"};
		System.out.println("~~~~~~~~~~~~~~~~!!!"+SeatReq);
		//Map<String, Object> data = new HashMap<String, Object>();

		
		return SeatReq;
	}
	@RequestMapping(value="/{pf_code}/step2", method=RequestMethod.GET )
	public ModelAndView performreseGet2(@PathVariable String pf_code, PerformReservationVO PfRese, ModelAndView modelnView) throws SQLException{

		String url = "perform/step2";
		System.out.println("~~~>>"+PfRese);
		List<SeatReqVO> SeatReqList = PFRESEService.getSeatList(PfRese.getPfsh_code());
		System.out.println("#####################"+SeatReqList);
		modelnView.addObject("PfRese", PfRese);
		modelnView.addObject("SeatReqList", SeatReqList);
		modelnView.setViewName(url);
		
		
		return modelnView;
	}
	@RequestMapping(value="/{pf_code}/step3", method=RequestMethod.GET )
	public ModelAndView performreseGet3(@PathVariable String pf_code,String seat_code,ModelAndView modelnView) throws SQLException{

		
	
		System.out.println(seat_code);
		
		
		return modelnView;
	}
}
