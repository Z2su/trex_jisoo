package com.trex.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

<<<<<<< HEAD
import com.trex.dao.MemberDAO;
=======
import com.trex.dto.AdVO;
import com.trex.dto.EventVO;
import com.trex.dto.FAQBoardVO;
>>>>>>> refs/heads/jisoo
import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.NoticeVO;
import com.trex.dto.PFSHViewVO;
import com.trex.dto.PerformVO;
import com.trex.dto.TroupeVO;
<<<<<<< HEAD
import com.trex.mail.MimeAttachNotifier;
=======
import com.trex.service.AdService;
import com.trex.service.EventService;
import com.trex.service.FAQBoardService;
>>>>>>> refs/heads/jisoo
import com.trex.service.MemberService;
import com.trex.service.NoticeService;
import com.trex.service.PerformService;

@Controller
public class CommonController {
	


	@Autowired
	private AdService adService; 
	

	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MimeAttachNotifier noti;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FAQBoardService faqService;
	@Autowired
	private EventService eventService;
	@Autowired
	private PerformService pfService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String mainGET(Model model) throws Exception {
		
		List<AdVO> adBannerList = adService.getAdBannerList();
		List<NoticeVO> noticeList = noticeService.getNoticeList();
		List<FAQBoardVO> faqList = faqService.listSearch();
		List<EventVO> eventList = eventService.eventList();
		List<PerformVO> pfList = pfService.getPFList();
		
		model.addAttribute("adList",adBannerList);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("faqList",faqList);
		model.addAttribute("eventList",eventList);
		model.addAttribute("pfList",pfList);
		
		System.out.println(adBannerList);
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
		out.println("location.href='/';alert('*회원가입을 축하드립니다 가입 이메일로 인증을 해주세요.*' );");
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
		
		String[] emails=member.getMem_email().split(",");
		String email = emails[0]+"@"+emails[1];
		member.setMem_email(email);
		String code = "";
		try {
			code = MemberService.regist(member, "TR");
			troupe.setTro_code(code);
			MemberService.regist(troupe);
			MemberService.create(member);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='/';alert('*회원가입을 축하드립니다 가입 이메일로 인증을 해주세요.*' );");
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
	
	
	@RequestMapping("/find")
	public String find()throws Exception{
		return "join/find";
	}
	@RequestMapping(value = "/find/id",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> findIdPost(String mem_email, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr) throws Exception {
		
		ResponseEntity<String> result=null;
		
		System.out.println(mem_email);
		
		MemberVO member = MemberService.getMemberByEmail(mem_email);
		String mem_id=null;
		if(member!=null) {
			mem_id= member.getMem_id();
			result = new ResponseEntity<String>(mem_id,HttpStatus.OK);
		}else {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		
		return result;
	}
	
	@RequestMapping(value = "/find/pwd",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> findPwdEmailSendPost(@RequestBody Map<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr) throws Exception {
		
		ResponseEntity<String> result=null;
			
		String mem_id = (String)paramMap.get("mem_id");
		String mem_email = (String)paramMap.get("mem_email");
		
		
		MemberVO member = MemberService.getMember(mem_id);
		
		if(member!=null) {
			if(mem_email.equals(member.getMem_email())) {
				//임시비밀번호 설정
				String tempPwd = UUID.randomUUID().toString().replace("-","").substring(0,8);
				
				member.setMem_pwd(tempPwd);
				
				try {
					MemberService.modifyPWD(member);
				}catch(SQLException e) {
					return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
					
				}
								
				//이메일로 패스워드를 전송.
				MailRequest mailReq = new MailRequest();
				mailReq.setSender("wwwsoo012@naver.com");
				mailReq.setReceiver(mem_email);
				mailReq.setTitle("[TRex 이용안내]변경된 패스워드를 확인하세요. ");
				mailReq.setContent("회원님의 비밀번호 : '"+member.getMem_pwd()+"' 로 변경되었습니다.");
				
				noti.sendMail(mailReq);		
				
				result = new ResponseEntity<String>("success",HttpStatus.OK);
			}else {
				//이메일 불일치.
				result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}			
		}else {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		
		return result;
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
		
		
	
	

