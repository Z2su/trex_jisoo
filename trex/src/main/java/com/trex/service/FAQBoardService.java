package com.trex.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.trex.controller.SearchCriteria;
import com.trex.dto.FAQBoardVO;


@Service
public interface FAQBoardService {
	
	Map<String, Object> getList(SearchCriteria cri) throws Exception;
	
	void create() throws Exception;
	 void create(FAQBoardVO faq) throws Exception;
	 void create(FAQBoardVO faq,HttpServletRequest request)throws Exception;
	

	 FAQBoardVO read(int faq_num) throws Exception;

	 FAQBoardVO readByNum(int faq_num) throws Exception;

	 void modify(FAQBoardVO faq) throws Exception;

	 void remove(int faq_num) throws Exception;

	


	 List<FAQBoardVO> listSearch(SearchCriteria cri) throws Exception;
	 List<FAQBoardVO> listSearch() throws Exception;

	int readSearchBoardCount(SearchCriteria cri) throws Exception;
}
