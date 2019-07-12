package com.trex.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.TroupeVO;
import com.trex.service.MemberService;

@Controller
public class CommonController {
	@Autowired
	private MemberService MemberService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String mainGET() {
		return "main";
	}
	@RequestMapping(value="/board",method=RequestMethod.GET)
	public String boardGET() {
		return "/board/boardmain";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String memberjoinfirstGET() {
		return "join/joinfirst";
	}

	@RequestMapping(value = "/joinmain", method = RequestMethod.GET)
	public String memberjoinmainGET() {
		return "join/joinmain";
	}

	@RequestMapping(value = "/joingmem", method = RequestMethod.GET)
	public String memberjoingmemGET() {
		return "join/joingmem";
	}

	@RequestMapping(value = "/joinregist", method = RequestMethod.POST)
	public String memberjoingmemPOST(MemberVO member, GmemberVO Gmember, HttpServletResponse response)
			throws Exception {
		String code = "";
		/* member.setMem_code("GM0001"); */
		try {
			code = MemberService.regist(member, "GM");
			System.out.println("member >> " + member);

			System.out.println("code lllll ===" + code);
			Gmember.setGmem_code(code);
			System.out.println("Gmember >> " + Gmember);
			MemberService.regist(Gmember);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='/';alert('*회원가입을 축하드립니다.*' );");
		out.println("</script>");

		return "main";

	}
	

	@RequestMapping(value = "/jointro", method = RequestMethod.GET)
	public String memberjointroGET() {
		return "join/jointro";
	}

	@RequestMapping(value = "/jointro", method = RequestMethod.POST)
	public String memberjointroPOST(MemberVO member, TroupeVO troupe, HttpServletResponse response) throws Exception {
		String code = "";
		try {
			code = MemberService.regist(member, "TR");
			System.out.println("member >> " + member);

			System.out.println("code lllll ===" + code);
			troupe.setTro_code(code);
			System.out.println("Troupe >> " + troupe);
			MemberService.regist(troupe);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='/';alert('*회원가입을 축하드립니다.*' );");
		out.println("</script>");

		return "main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String memberloginGET() {
		return "/join/login";
	}
	
	@RequestMapping(value = "/login", method= RequestMethod.POST)
	public String memberloginPOST(LoginRequest loginReq,String mem_id, HttpSession session,RedirectAttributes rttr)throws SQLException{
		
		String url="redirect:/";
		String message="";
		System.out.println("mem_id: >>"+mem_id);
		System.out.println("loginReq..."+loginReq);
		String id=loginReq.getMem_id();
		String pwd=loginReq.getMem_pwd();
		MemberVO member = null;
		
		member = MemberService.getMember(id);
		if(member!=null) {///id가 존재 
			if(pwd.equals(member.getMem_pwd())){//비밀번호 일치
				System.out.println("로그인");
				session.setAttribute("loginUser", member);
				message="로그인 하셨습니다.";
			}else {//비밀번호 불일치
				url="redirect:/login";
				message="패스워드가 불일치합니다.";
			}
		}else {//id가 없을때
			url="redirect:/login";
			message="존재하지 않는 아이디입니다.";		
		}
		
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("id",loginReq.getMem_id());
		paramMap.put("message",message);
				
		rttr.addFlashAttribute("paramMap",paramMap);
	
		return url;
	}
	
		
		
		
	}

