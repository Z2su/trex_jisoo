package com.trex.controller;

import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trex.dao.MemberDAO;
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
	
	@RequestMapping(value="/calendar",method=RequestMethod.GET)
	public  void calGET() {
	
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
	
	@ResponseBody
    @RequestMapping(value = "/checkSignup", method = RequestMethod.POST)
    public int checkSignup(HttpServletRequest request, Model model) {
        String mem_id = request.getParameter("mem_id");
        int rowcount=-1;
        	MemberVO member;
        	System.out.println("member------:"+mem_id);
			try {
				member = MemberService.getMember(mem_id);
				
				if(member==null) {
					rowcount=0;
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        return rowcount;
    }
	

	   
		

	@RequestMapping(value = "/joinregist", method = RequestMethod.POST)
	public String memberjoingmemPOST(MemberVO member, GmemberVO Gmember, HttpServletResponse response)
			throws Exception {
		
		
		
		String[] emails=member.getMem_email().split(",");
		String email = emails[0]+"@"+emails[1];
		member.setMem_email(email);
		String code = "";
		member.setMem_code("GM0001"); 
		try {
			code = MemberService.regist(member, "GM");

			Gmember.setGmem_code(code);
			MemberService.regist(Gmember);
			MemberService.create(member);
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
	
	@ResponseBody
    @RequestMapping(value = "/checkSignuptwo", method = RequestMethod.POST)
    public int checkSignuptwo(HttpServletRequest request, Model model) {
        String tro_id = request.getParameter("tro_id");
        int rowcount=-1;
        	TroupeVO troupe;
			try {
				troupe = MemberService.getTroupe(tro_id);
				if(troupe==null) {
					rowcount=0;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        return rowcount;
	}

	@RequestMapping(value = "/jointro", method = RequestMethod.POST)
	public String memberjointroPOST(MemberVO member, TroupeVO troupe, HttpServletResponse response) throws Exception {
		System.out.println("!!!!!!!!!!!!!!!!!!!!>>>>>>지워"+member.getMem_email());
		
		/*String[] emails=member.getMem_email().split(",");
		String email = emails[0]+"@"+emails[1];
		member.setMem_email(email);*/
		String code = "";
		try {
			code = MemberService.regist(member, "TR");
			troupe.setTro_code(code);
			MemberService.regist(troupe);
/*			MemberService.create(member);
*/
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

	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		String url="redirect:/";
		session.invalidate();
		return url;
	}
	
	@RequestMapping(value="/joinPost", method=RequestMethod.POST)
	public String joinPost(@ModelAttribute("uVO") MemberVO member) throws Exception {
		//logger.info("currnent join member: " + uVO.toString());
		MemberService.create(member);
		
		return "/joinPost";
	}
	
	@RequestMapping(value="/joinConfirm", method=RequestMethod.GET)
	public String emailConfirm(@ModelAttribute("uVO") MemberVO member, Model model) throws Exception {
		//logger.info(uVO.getEmail() + ": auth confirmed");
		String url="redirect:/login";
		
		member.setAuthstatus(1);	// authstatus를 1로,, 권한 업데이트
		
		MemberService.updateAuthstatus(member);
		
		model.addAttribute("auth_check", 1);
		
		return url;
	}

	
	

	}
		
		
	
	

