package com.trex.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.trex.controller.Criteria;
import com.trex.controller.SearchCriteria;

import com.trex.dto.QnABoardVO;
import com.trex.dto.QnAReplyVO;


@Service
public interface QnAReplyService {
	
	
	void create() throws Exception;
	 void create(QnAReplyVO qnarep, String qna_code) throws Exception;
	 

	 QnAReplyVO read(int rep_num) throws Exception;

	 QnAReplyVO readByNum(int rep_num) throws Exception;

	 void modify(QnAReplyVO reply) throws Exception;

	 void remove(int rep_num) throws Exception;


	 List<QnAReplyVO> listSearch() throws Exception;

	
}
