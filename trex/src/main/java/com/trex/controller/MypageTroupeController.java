package com.trex.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trex.dto.MemberVO;
import com.trex.dto.MypageTroupeAdListVO;
import com.trex.dto.MypageTroupeCrAppListVO;
import com.trex.dto.MypageTroupeVO;
import com.trex.service.MypageGmemberService;
import com.trex.service.MypageTroupeService;

@Controller
@RequestMapping("/mypage")
public class MypageTroupeController {
	
	@Autowired
	private MypageTroupeService MypageTroupeService;
	
	@Autowired
	private MypageGmemberService gMemService;
	

	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "마이페이지";
	}

	@ModelAttribute("submenuList")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]>();

		submenuList.add(new String[] { "공연단정보조회", "MypageTroupeList" });
		submenuList.add(new String[] { "대관신청조회", "MypageTroupeCrAppList" });
		submenuList.add(new String[] { "광고신청조회", "MypageTroupeAdList" });
		submenuList.add(new String[] { "회원탈퇴", "MypageTroupeSec" });

		return submenuList;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainGET() {
		return "/";
	}

	@RequestMapping(value = "/MypageTroupeList")
	public String MypageTroupeListGET(HttpServletRequest request, HttpServletResponse response, Model model) throws SQLException {

		HttpSession session = request.getSession();
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String troupe_code = loginUser.getMem_code();

		MypageTroupeVO troupe = MypageTroupeService.gettroupe(troupe_code);

		model.addAttribute("troupe", troupe);

		return "mypage/MypageTroupeList";
	}

	@RequestMapping(value = "/MypageTroupeModify", method = RequestMethod.GET)
	public String MypageTroupeModifyGET(String id, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		List<MypageTroupeVO> Troure = new ArrayList<MypageTroupeVO>();
		model.addAttribute("Troure", Troure);

		return "mypage/MypageTroupeModify";
	}

	@RequestMapping(value = "/MypageTroupeSec", method = RequestMethod.GET)
	public String MypageTroupeSecGET(String id, HttpServletRequest request, HttpServletResponse response, Model model) {

		List<MypageTroupeVO> Troure = new ArrayList<MypageTroupeVO>();
		model.addAttribute("Troure", Troure);

		return "mypage/MypageTroupeSec";
	}

	@RequestMapping(value = "/MypageTroupeCrAppList", method = RequestMethod.GET)
	public String MypageTroupeCrAppListGET(String id, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		List<MypageTroupeCrAppListVO> Troure = new ArrayList<MypageTroupeCrAppListVO>();
		model.addAttribute("Troure", Troure);

		return "mypage/MypageTroupeCrAppList";
	}

	@RequestMapping(value = "/MypageTroupeAdList", method = RequestMethod.GET)
	public String MypageTroupeAdListGET(String id, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		List<MypageTroupeAdListVO> Troure = new ArrayList<MypageTroupeAdListVO>();
		model.addAttribute("Troure", Troure);

		return "mypage/MypageTroupeAdList";
	}
}
