package com.trex.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
		System.out.println(qnaboard);
	}

}
