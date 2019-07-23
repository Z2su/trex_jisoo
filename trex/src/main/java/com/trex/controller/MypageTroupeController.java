package com.trex.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.AdVO;
import com.trex.dto.CrAppVO;
import com.trex.dto.MemberVO;
import com.trex.dto.MypageGmemberVO;
import com.trex.dto.MypageTroupeVO;
import com.trex.request.Criteria;
import com.trex.service.AdService;
import com.trex.service.CrAppService;
import com.trex.service.MypageGmemberService;
import com.trex.service.MypageTroupeService;

@Controller
@RequestMapping("/mypage")
public class MypageTroupeController {

	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private CrAppService CrAppService;

	@Autowired
	private AdService adService;

	@Autowired
	private MypageGmemberService gMemService;

	@Autowired
	private MypageTroupeService MypageTroupeService;

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
	public String MypageTroupeListGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws SQLException {

		HttpSession session = request.getSession();

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String troupe_code = loginUser.getMem_code();

		MypageTroupeVO troupe = MypageTroupeService.gettroupe(troupe_code);

		model.addAttribute("troupe", troupe);

		return "mypage/MypageTroupeList";
	}

	@RequestMapping(value = "/MypageTroupeModify", method = RequestMethod.GET)
	public String MypageTroupeModifyGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		HttpSession session = request.getSession();

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String troupe_code = loginUser.getMem_code();

		MypageTroupeVO troupe = MypageTroupeService.gettroupe(troupe_code);

		model.addAttribute("troupe", troupe);

		return "mypage/MypageTroupeModify";
	}

	@RequestMapping(value = "/MypageTroupeSec", method = RequestMethod.GET)
	public String MypageTroupeSecGET(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		HttpSession session = request.getSession();

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String troupe_code = loginUser.getMem_code();

		MypageTroupeVO troupe = MypageTroupeService.gettroupe(troupe_code);

		model.addAttribute("troupe", troupe);

		return "mypage/MypageTroupeSec";
	}

	@RequestMapping(value = "/MypageTroupeCrAppList", method = RequestMethod.GET)
	public ModelAndView MypageTroupeCrAppListGET(ModelAndView modelnView, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String url = "mypage/MypageTroupeCrAppList";

		List<CrAppVO> CRAppBoardList = null;

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String mem_code = loginUser.getMem_code();

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);

		try {
			CRAppBoardList = CrAppService.getBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		modelnView.addObject("CRAppBoardList", CRAppBoardList);
		modelnView.setViewName(url);
		modelnView.addObject("gmem", gmem);

		return modelnView;
	}

	@RequestMapping(value="/MypageTroupeCrAppDetail/{cr_app_code}",method=RequestMethod.GET)
	public ModelAndView detailGET(@PathVariable String cr_app_code, ModelAndView modelnView) {
		String url = "mypage/MypageTroupeCrAppDetail";
		
		CrAppVO CRAppBoard = null;
		
		try {
			CRAppBoard = CrAppService.readBoard(cr_app_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("CR_App~~~"+CRAppBoard);
		modelnView.addObject("CRAppBoard",CRAppBoard);
		modelnView.setViewName(url);
		
		return modelnView;
	}

	@RequestMapping(value = "/MypageTroupeAdList", method = RequestMethod.GET)
	public String MypageTroupeAdListGET(Criteria cri, HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String mem_code = loginUser.getMem_code();

		Map<String, Object> dataMap = adService.getAdList(cri);

		MypageGmemberVO gmem = gMemService.getGmember(mem_code);

		model.addAttribute("dataMap", dataMap);
		model.addAttribute("gmem", gmem);

		return "mypage/MypageTroupeAdList";
	}

	@RequestMapping(value = "/MypageTroupeAdDetail", method = RequestMethod.GET)
	public ModelAndView MypageTroupeAdDetailGET(int ad_num, ModelAndView modelnView) throws SQLException {
		AdVO ad = adService.adDetail(ad_num);
		modelnView.addObject("ad", ad);
		return modelnView;
	}
}