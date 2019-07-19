package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trex.dto.EPViewVO;
import com.trex.dto.EmployeeVO;
import com.trex.dto.MemberVO;
import com.trex.dto.TroupeVO;
import com.trex.service.MemberService;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private MemberService mservice;
	
	

	
	
	@RequestMapping(value="/myinfo")
	public void myinfoGET() {
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
	public String memberjointroPOST(MemberVO member, EmployeeVO employee, HttpServletResponse response) throws Exception {
		
		mservice.regist(member,employee);
		
		response.setContentType("text/html;charset=utf-8");
		
		return "redirect:/manager/list";
	}
	
	
	
	
	
	@RequestMapping(value="/memlist")
	public void list3GET() {
	}
	
	@RequestMapping(value="/calendar")
	public void calenderGET() {
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
