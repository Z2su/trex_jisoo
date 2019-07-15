package com.trex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.controller.SearchCriteria;
import com.trex.dao.AttachDAO;
import com.trex.dao.FAQBoardDAO;
import com.trex.dto.AttachVO;
import com.trex.dto.FAQBoardVO;
import com.trex.dto.QnABoardVO;

public class FAQBoardServiceImpl implements FAQBoardService {
	
	@Autowired
	private FAQBoardDAO faqBoardDAO;
	
	public void setFAQboardDAO(FAQBoardDAO faqboardDAO) {
		this.faqBoardDAO = faqboardDAO;
	}
	@Autowired
	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public void create(FAQBoardVO faq) throws Exception {
		int num = faqBoardDAO.NextSeq();

		String code = "FAQ" + String.format("%04d", num);
		faq.setFAQ_code(code);
		faq.setFAQ_num(num);
		faqBoardDAO.insertFAQBoard(faq);
		
		
		}


	@Override
	public FAQBoardVO read(int faq_num) throws Exception {
		FAQBoardVO faqboard = faqBoardDAO.selectBoardByNum(faq_num);
		faqBoardDAO.increaseViewcnt(faq_num);
		return faqboard;
	}


	@Override
	public FAQBoardVO readByNum(int faq_num) throws Exception {
		FAQBoardVO faqboard = faqBoardDAO.selectBoardByNum(faq_num);

		return faqboard;
	}

	@Override
	public void modify(FAQBoardVO faq) throws Exception {
		faqBoardDAO.updateFAQBoardVO(faq);
		}

	@Override
	public void remove(int faq_num) throws Exception {
		faqBoardDAO.deleteFAQBoardVO(faq_num);
	}

	@Override
	public List<FAQBoardVO> listSearch(SearchCriteria cri) throws Exception {
		List<FAQBoardVO> faqlist = faqBoardDAO.selectSearchBoardList(cri);

		return faqlist;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws Exception {
		int count = faqBoardDAO.selectSearchBoardCount(cri);
		return count;
	}

}
