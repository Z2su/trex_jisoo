package com.trex.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.trex.controller.SearchCriteria;
import com.trex.dto.QnABoardVO;


@Service
public interface QnABoardService {
	
	Map<String, Object> getList(SearchCriteria cri) throws Exception;
	
	void create() throws Exception;
	 void create(QnABoardVO qna) throws Exception;
	 void create(QnABoardVO qna,HttpServletRequest request)throws Exception;
	

	 QnABoardVO read(int qna_num) throws Exception;

	 QnABoardVO readByNum(int qna_num) throws Exception;

	 void modify(QnABoardVO qna) throws Exception;

	 void remove(int qna_num) throws Exception;

	


	 List<QnABoardVO> listSearch(SearchCriteria cri) throws Exception;
	 List<QnABoardVO> listSearch() throws Exception;

	int readSearchBoardCount(SearchCriteria cri) throws Exception;
}
