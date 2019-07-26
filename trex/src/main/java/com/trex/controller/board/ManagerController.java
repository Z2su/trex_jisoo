package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trex.controller.CalendarData;
import com.trex.dto.CalendarVO;
import com.trex.dto.EPViewVO;
import com.trex.dto.EmployeeVO;
import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.MypageTroupeVO;
import com.trex.dto.TroupeVO;
import com.trex.service.CalendarService;
import com.trex.service.MemberService;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private CalendarService calService;
	
	
	@RequestMapping(value="/myinfo")
	public void myinfoGET(HttpSession session, Model model)
			throws SQLException {

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

		String ep_code = loginUser.getMem_code();

		EmployeeVO employee = mservice.getEmployee(ep_code);

		model.addAttribute("employee", employee);

	}
	
	
	
	@RequestMapping(value="/eplist" )
	public void listGET( Model model ) throws Exception {
		List<EPViewVO> eplist = mservice.getEmployeeList();
		model.addAttribute("eplist", eplist);
		
	}
	
	@RequestMapping(value="/epregist", method= RequestMethod.GET )
	public void epregistGET( ) throws Exception {
		
	}
	
	@RequestMapping(value = "/epregist", method = RequestMethod.POST)
	public String epregistPOST(MemberVO member, EmployeeVO employee, HttpServletResponse response) throws Exception {
		
		mservice.regist(member,employee);
		
		response.setContentType("text/html;charset=utf-8");
		
		return "redirect:/manager/eplist";
	}
	
	@RequestMapping(value = "/epdelete")
	public String epdeletrPOST(String code, HttpServletResponse response) throws Exception {
		
		mservice.delete(code);
		response.setContentType("text/html;charset=utf-8");
		
		return "redirect:/manager/eplist";
	}
	
	
	
	
	
	@RequestMapping(value="/memlist")
	public void memlistGET(Model model) throws Exception {
		List<GmemberVO> glist = mservice.getGmemberList();
		List<TroupeVO> tlist = mservice.getTroupeList();
		List<MemberVO> gmemlist = mservice.getMemberListlike("GM");
		List<MemberVO> tmemlist = mservice.getMemberListlike("TR");
		model.addAttribute("glist", glist);
		model.addAttribute("tlist",  tlist);
		model.addAttribute("gmemlist",  gmemlist);
		model.addAttribute("tmemlist",  tmemlist);
		
		System.out.println(gmemlist);
		
	}
	
	@RequestMapping(value="/calendar")
	public void calenderGET() {
	}
	
	@RequestMapping(value="/calendar/list",method=RequestMethod.GET)
	@ResponseBody
	public List<CalendarData> list()throws Exception{
		List<CalendarVO> calendarList=calService.calenderlist();
		
		List<CalendarData> dataList = new ArrayList<CalendarData>();
		for(CalendarVO calendar : calendarList) {
			dataList.add(new CalendarData(calendar));			
		}
		
		return dataList;
		
	}
	
	@RequestMapping(value = "/calregist", method = RequestMethod.GET)
	public void registCalGET() throws Exception {


	}
	
	
	@RequestMapping(value="/calregist", method = RequestMethod.POST)

	public void calregist(CalendarVO calendar,HttpServletResponse response)throws Exception{
		calService.create(calendar);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");		
		out.println("window.opener.location.href='/manager/calendar';window.opener.location.reload();window.close();");
		out.println("</script>");	
	}
	
	@RequestMapping(value="/delete" )
	   public String caldelete(String code,HttpServletResponse response)throws Exception{
	      calService.remove(code);
	      return "manager/calendar";
	      
	   }
	
	
	
	
	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "관리자!!";
	}
	
	
	
	@ModelAttribute("submenuList")
	public List<String[]> submenuModel(){
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"내정보","myinfo"});
		submenuList.add(new String[] {"직원관리","eplist"});
		submenuList.add(new String[] {"회원관리","memlist"});
		submenuList.add(new String[] {"일정","calendar"});
		
		return submenuList;
	}


}
