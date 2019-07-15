package com.trex.controller.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.AdVO;
import com.trex.dto.PrVO;
import com.trex.service.AdService;

@Controller
@RequestMapping("/board")
public class AdController {
	
	@Autowired
	private AdService adService;

	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "홍보게시판";
	}

	@ModelAttribute("submenuList")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]>();

		submenuList.add(new String[] { "홍보게시판", "/board/pr/prlist" });
		submenuList.add(new String[] { "광고게시판", "/board/ad/adlist" });
		submenuList.add(new String[] { "이벤트", "/board/event/list" });

		return submenuList;
	}

	@RequestMapping(value = "/ad/adlist", method = RequestMethod.GET)
	public void prlistGET(Model model) throws Exception {

		List<AdVO> adlist = adService.adList();

		model.addAttribute("adlist", adlist);

	}
	
	@RequestMapping(value="/ad/addetail", method = RequestMethod.GET)
	public ModelAndView addetailGET(int ad_num, ModelAndView modelnView) throws SQLException{
		AdVO ad = adService.adDetail(ad_num);
		modelnView.addObject("ad",ad);
		return modelnView;
	}

	@RequestMapping(value = "/ad/adregist", method = RequestMethod.GET)
	public void adregistGET() {
	}

}
