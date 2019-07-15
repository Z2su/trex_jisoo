package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.FAQBoardVO;
import com.trex.dto.QnABoardVO;

public interface FAQBoardService {
	
		public void create(FAQBoardVO faq) throws Exception;

		public FAQBoardVO read(int faq_num) throws Exception;

		public FAQBoardVO readByNum(int faq_num) throws Exception;

		public void modify(FAQBoardVO faq) throws Exception;

		public void remove(int faq_num) throws Exception;



		public List<FAQBoardVO> listSearch(SearchCriteria cri) throws Exception;

		int readSearchBoardCount(SearchCriteria cri) throws Exception;
	}



