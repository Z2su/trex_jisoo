package com.trex.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trex.dto.MemberVO;
import com.trex.dto.MypageGmemberVO;
import com.trex.dto.QnABoardVO;
import com.trex.dto.QnAReplyVO;
import com.trex.service.MypageGmemberService;
import com.trex.service.QnABoardService;
import com.trex.service.QnAReplyService;

@Controller
@RequestMapping("/mypage")
public class MypageMemberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private QnABoardService service;
	
	@Autowired
	private QnAReplyService reservice;
	
	@Autowired
	private MypageGmemberService gMemService;

	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "마이페이지";
	}
	
	@ModelAttribute("submenuList")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]>();

		submenuList.add(new String[] { "회원정보조회", "MypageMemberList" });
		submenuList.add(new String[] { "예매확인 및 취소", "MypageMemberRescHis" });
		submenuList.add(new String[] { "마일리지조회", "MypageMemberMile" });
		submenuList.add(new String[] { "게시글조회", "MypageMemberBoardList" });
		submenuList.add(new String[] { "회원탈퇴", "MypageMemberSec" });

		return submenuList;
	}

	@RequestMapping(value = "/")
	public String main() {
		return "/";
	}

	@RequestMapping("/MypageMemberList")
	public String MypageGmemberListGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws SQLException {

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String mem_code = loginUser.getMem_code();

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);

		model.addAttribute("gmem", gmem);

		return "mypage/MypageMemberList";
	}

	@RequestMapping(value = "/MypageMemberModify", method = RequestMethod.GET)
	public String MypageMemberModifyGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		HttpSession session = request.getSession();

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String mem_code = loginUser.getMem_code();

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);

		model.addAttribute("gmem", gmem);

		return "mypage/MypageMemberModify";
	}

	@RequestMapping(value = "/MypageMemberModify", method = RequestMethod.POST)
	public String MypageMemberModifyPOST(String mem_code) throws Exception {

		gMemService.getGmember(mem_code);

		return "redirect:/mypage/MypageMemberModify";
	}

	@RequestMapping(value = "/MypageMemberSec", method = RequestMethod.GET)
	public String MypageMemberSecGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		HttpSession session = request.getSession();

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String mem_code = loginUser.getMem_code();

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);

		model.addAttribute("gmem", gmem);

		return "mypage/MypageMemberSec";
	}

	@RequestMapping(value = "/MypageMemberSec", method = RequestMethod.POST)
	public void remove(String mem_id, HttpServletResponse response) throws Exception {
		gMemService.remove(mem_id);
	}

	@RequestMapping(value = "/MypageMemberRescHis", method = RequestMethod.GET)
	public String MypageMemberRescHisGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		HttpSession session = request.getSession();

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String mem_code = loginUser.getMem_code();

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);

		model.addAttribute("gmem", gmem);

		return "mypage/MypageMemberRescHis";
	}

	@RequestMapping(value = "/MypageMemberMile", method = RequestMethod.GET)
	public String MypageMemberMileGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws SQLException {

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String mem_code = loginUser.getMem_code();

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);

		model.addAttribute("gmem", gmem);

		return "mypage/MypageMemberMile";
	}

	@RequestMapping(value = "/MypageMemberBoardList", method = RequestMethod.GET)
	public String MypageMemberBoardListGET(@ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		List<QnABoardVO> qnalist = service.listSearch(cri);
		List<QnAReplyVO> replist = reservice.listSearch();
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String mem_code = loginUser.getMem_code();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.readSearchBoardCount(cri));
		model.addAttribute(pageMaker);

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);
		
		model.addAttribute("list", qnalist);
		model.addAttribute("replist", replist);
		model.addAttribute("gmem", gmem);

		return "mypage/MypageMemberBoardList";
	}
}
