package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.FAQBoardVO;

public interface FAQBoardDAO {
	

	public void insertFAQBoard(FAQBoardVO faq)throws Exception;
	public FAQBoardVO selectBoardByNum(int faq_num)throws Exception;
	public void updateFAQBoardVO(FAQBoardVO faq)throws Exception;
	public void deleteFAQBoardVO(int faq_num)throws Exception;
	
	void increaseViewcnt(int faq_num) throws Exception;
			
	List<FAQBoardVO> selectSearchBoardList(SearchCriteria cri) throws Exception;
	int selectSearchBoardCount(SearchCriteria cri) throws Exception;
	
	int NextSeq() throws SQLException;


	}

