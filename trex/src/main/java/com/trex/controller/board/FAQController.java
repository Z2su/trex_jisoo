package com.trex.controller.board;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trex.controller.PageMaker;
import com.trex.controller.SearchCriteria;
import com.trex.dto.FAQBoardVO;
import com.trex.service.FAQBoardService;

@Controller
@RequestMapping("/board/center/faq")
public class FAQController {

	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private FAQBoardService FAQBoardService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, Model model)
			throws Exception {
		List<FAQBoardVO> faqlist = FAQBoardService.listSearch(cri);
		model.addAttribute("list", faqlist);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(FAQBoardService.readSearchBoardCount(cri));
		model.addAttribute(pageMaker);

	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(@ModelAttribute("cri") SearchCriteria cri, int faq_num, Model model) throws Exception {
		FAQBoardVO faqboard = FAQBoardService.read(faq_num);
		model.addAttribute("faqboard", faqboard);

	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registerGET() throws Exception {
	}

	@RequestMapping(value = "/replyregist", method = RequestMethod.GET)
	public void replyregistGET(int faq_num, Model model) throws Exception {
		FAQBoardVO faqboard = FAQBoardService.readByNum(faq_num);
		model.addAttribute("faqboard", faqboard);

	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public ModelAndView registPOST(HttpServletRequest request, FAQBoardVO faqboard, RedirectAttributes rtts)
			throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/center/faq/list");

		FAQBoardService.create(faqboard);

		rtts.addFlashAttribute("msg", "SUCCESS");
		return mv;
	}

	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@ModelAttribute("cri") SearchCriteria cri, int faq_num, Model model) throws Exception {
		FAQBoardVO faqboard = FAQBoardService.readByNum(faq_num);
		model.addAttribute("faqboard", faqboard);

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(FAQBoardVO faqboard, RedirectAttributes rtts) throws Exception {

		System.out.println(faqboard);
		faqboard.setModidate(new Date());
		FAQBoardService.modify(faqboard);
		rtts.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/board/center/faq/list";

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int faq_num, HttpServletResponse response) throws Exception {
		FAQBoardService.remove(faq_num);
		return "redirect:/board/center/faq/list";
	}

}
