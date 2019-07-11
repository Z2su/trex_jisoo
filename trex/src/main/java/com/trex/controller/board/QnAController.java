package com.trex.controller.board;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trex.controller.PageMaker;
import com.trex.controller.SearchCriteria;
import com.trex.dto.QnABoardVO;
import com.trex.service.QnABoardService;

@Controller
@RequestMapping("/board/center/qna")
public class QnAController {
	
	
	@Autowired
	private QnABoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		List<QnABoardVO> qnalist = service.listSearch(cri);
		model.addAttribute("list", qnalist);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.readSearchBoardCount(cri));
		model.addAttribute(pageMaker);

	}
	
	@RequestMapping(value="/detail",method = RequestMethod.GET) 
	public void detail(@ModelAttribute("cri")SearchCriteria cri,
			int qna_num, Model model )throws Exception{
		QnABoardVO qnaboard = service.read(qna_num);
		model.addAttribute("qnaboard",qnaboard);
	
	}
	
	@RequestMapping(value="/regist",method = RequestMethod.GET)
	public void registerGET() throws Exception{}
	
	@RequestMapping(value="/regist",method = RequestMethod.POST)
	public String registPOST(QnABoardVO qnaboard, RedirectAttributes rtts )throws Exception{
		service.create(qnaboard);
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/board/center/qna/list"; 
	}
	
	@RequestMapping(value="/modify",method = RequestMethod.GET)
	public void modifyGET(@ModelAttribute("cri")SearchCriteria cri,
			int qna_num, Model model ) throws Exception{
	QnABoardVO qnaboard = service.readByNum(qna_num);
	model.addAttribute("qnaboard", qnaboard);
	
	
	}
	
	@RequestMapping(value="/modify",method = RequestMethod.POST)
	public String modifyPOST(QnABoardVO qnaboard, RedirectAttributes rtts )throws Exception{
		
		qnaboard.setModidate(new Date());
		service.modify(qnaboard);
		rtts.addFlashAttribute("msg","SUCCESS");
		System.out.println(qnaboard);
		
		return "redirect:/board/center/qna/list"; 
	
	}
	
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public String delete(
			int qna_num,HttpServletResponse response)throws Exception{
		service.remove(qna_num);
		
		
	
		return "redirect:/board/center/qna/list"; 
	}

}
