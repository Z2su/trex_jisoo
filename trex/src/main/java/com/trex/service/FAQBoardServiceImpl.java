package com.trex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.controller.SearchCriteria;
import com.trex.dao.FAQBoardDAO;
import com.trex.dto.FAQBoardVO;

public class FAQBoardServiceImpl implements FAQBoardService {

	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private FAQBoardDAO faqboardDAO;

	public void setFaqboardDAO(FAQBoardDAO faqboardDAO) {
		this.faqboardDAO = faqboardDAO;
	}

	@Override
	public Map<String, Object> getList(SearchCriteria cri) throws Exception {
		List<FAQBoardVO> faqList = faqboardDAO.selectSearchBoardList(cri);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("faqList", faqList);

		return dataMap;
	}

	@Override
	public void create() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(FAQBoardVO faq) throws Exception {
		int faq_num = faqboardDAO.NextSeq();
		String faq_code = "FAQ" + String.format("%04d", faq_num);
		faq.setFaq_code(faq_code);
		faq.setFaq_num(faq_num);
		faqboardDAO.insertFAQBoard(faq);
	}
	@Override
	public void create(FAQBoardVO faq, HttpServletRequest request) throws Exception {
		int faq_num = faqboardDAO.NextSeq();
		String faq_code = "FAQ" + String.format("%04d", faq_num);
		faq.setFaq_code(faq_code);
		faq.setFaq_num(faq_num);
		faqboardDAO.insertFAQBoard(faq);

	}

	@Override
	public FAQBoardVO read(int faq_num) throws Exception {
		FAQBoardVO faqboard = faqboardDAO.selectBoardByNum(faq_num);
		faqboardDAO.increaseViewcnt(faq_num);
		return faqboard;

	}

	@Override
	public FAQBoardVO readByNum(int faq_num) throws Exception {
		FAQBoardVO faqboard = faqboardDAO.selectBoardByNum(faq_num);

		return faqboard;
	}

	@Override
	public void modify(FAQBoardVO faq) throws Exception {
		faqboardDAO.updateFAQBoard(faq);
	}

	@Override
	public void remove(int faq_num) throws Exception {
		faqboardDAO.deleteFAQBoard(faq_num);
	}

	@Override
	public List<FAQBoardVO> listSearch(SearchCriteria cri) throws Exception {
		List<FAQBoardVO> faqlist = faqboardDAO.selectSearchBoardList(cri);

		return faqlist;
	}
	@Override
	public List<FAQBoardVO> listSearch() throws Exception {
		List<FAQBoardVO> faqlist = faqboardDAO.selectSearchBoardList();

		return faqlist;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws Exception {
		int count = faqboardDAO.selectSearchBoardCount(cri);
		return count;
	}

}