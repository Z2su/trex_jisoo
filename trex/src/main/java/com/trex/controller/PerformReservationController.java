package com.trex.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.PFSHViewVO;
import com.trex.dto.PerformReservationVO;
import com.trex.dto.PerformVO;
import com.trex.dto.RHVO;
import com.trex.dto.SeatReqVO;
import com.trex.dto.TicketVO;
import com.trex.service.MemberService;
import com.trex.service.PerformGuidBoardService;
import com.trex.service.PerformReservationService;
import com.trex.service.PerformService;
import com.trex.service.PerformServiceImpl;

@Controller
@RequestMapping("/performrese")
public class PerformReservationController {
	
	@Autowired
	private PerformReservationService PFRESEService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PerformService PFService;

	
	@RequestMapping(value="/{pf_code}/step1", method=RequestMethod.GET )
	public ModelAndView performreseGet(@PathVariable String pf_code, ModelAndView modelnView) throws SQLException{


		String url = "perform/step1";
		List<PFSHViewVO> PFSHViewList = PFRESEService.getPFSHViewList(pf_code);
		
		PerformVO PF = PFService.getPF(pf_code);
		modelnView.addObject("pf",PF);
		modelnView.addObject("PFSHViewList", PFSHViewList);
		modelnView.addObject("pf_code", pf_code);
		System.out.println("~~~~~~~********!!!"+PFSHViewList);
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
	
	@RequestMapping(value="/fast", method=RequestMethod.GET)
	public ModelAndView fastperformrese(ModelAndView modelnView) throws SQLException{
		
		String url = "perform/step";
		
		List<PerformVO> PFList = PFService.getPFList();
		modelnView.addObject("PFList", PFList);
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
	public ModelAndView performreseGet2(@PathVariable String pf_code, PerformReservationVO PfRese, String rdate, ModelAndView modelnView) throws SQLException{

		String url = "perform/step2";
		System.out.println("~~~>>"+PfRese);
		List<SeatReqVO> SeatReqList = PFRESEService.getSeatList(PfRese.getPfsh_code());
		System.out.println("#####################"+rdate);
		PerformVO PF = PFService.getPF(pf_code);
		modelnView.addObject("pf",PF);
		modelnView.addObject("PfRese", PfRese);
		modelnView.addObject("SeatReqList", SeatReqList);
		modelnView.addObject("rdate", rdate);
		modelnView.setViewName(url);
		
		
		return modelnView;
	}
	@RequestMapping(value="/{pf_code}/step3", method=RequestMethod.GET )
	public ModelAndView performreseGet3(@PathVariable String pf_code, 
										String seat_code,
										String pfsh_code,
										String rdate,
										HttpSession session,
										ModelAndView modelnView) throws SQLException{

		String url = "perform/step3";
		
		String mem_code = ((MemberVO)session.getAttribute("loginUser")).getMem_code();
		GmemberVO gmem = memberService.getGmember(mem_code);
		
		PerformVO PF = PFService.getPF(pf_code);
		String[] seat = seat_code.split(",");
		int price = 0;
		
		String pay_code="";
		for(int i=0;i<10;i++) {
			pay_code+=(int)(Math.random()*8+1);
		}
		

		for(int i=0 ; i<seat.length ; i++) {
			System.out.println("seatlenght!!!!!!!!"+seat[i]);
			price += PFRESEService.getSeatPrice(seat[i], pfsh_code);
			System.out.println("seatlenght!!!!!!44!!"+seat[i]);
			
			PFRESEService.updatePFSHSRESE(seat[i], pfsh_code);
			
			System.out.println("seatlenght!!!!!!4555!!"+seat[i]);
		}

		RHVO rh= new RHVO(price, pay_code, mem_code, pfsh_code);
		String rh_code = PFRESEService.insertRH(rh);
		
		
		TicketVO tk = new TicketVO();
		tk.setRh_code(rh_code);
		for(int i=0 ; i<seat.length ; i++) {
			tk.setSeat_code(seat[i]);
			PFRESEService.insertTicket(tk);
		}
		

		System.out.println(seat_code);
		modelnView.addObject("seat",seat);
		modelnView.addObject("rdate", rdate);

		modelnView.addObject("pf_name", PF.getName());
		modelnView.addObject("pay_code", pay_code);
		modelnView.addObject("pf_code", pf_code);
		modelnView.addObject("price", price);
		modelnView.addObject("gmem",gmem);
		modelnView.setViewName(url);
		//modelnView.addObject("seat", seat);
		
		return modelnView;
	}
}
