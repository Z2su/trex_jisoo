package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.QnABoardVO;



public interface QnABoardService {
	public void create(QnABoardVO qna) throws Exception;

	public QnABoardVO read(int qna_num) throws Exception;

	public QnABoardVO readByNum(int qna_num) throws Exception;

	public void modify(QnABoardVO qna) throws Exception;

	public void remove(int qna_num) throws Exception;



	public List<QnABoardVO> listSearch(SearchCriteria cri) throws Exception;

	int readSearchBoardCount(SearchCriteria cri) throws Exception;
}
