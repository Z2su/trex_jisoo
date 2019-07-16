package com.trex.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.trex.controller.SearchCriteria;
import com.trex.dto.FAQBoardVO;
import com.trex.dto.QnABoardVO;

public interface FAQBoardDAO {

	public void insertFAQBoard(FAQBoardVO faq) throws Exception;

	public FAQBoardVO selectBoardByNum(int faq_num) throws Exception;

	public void updateFAQBoard(FAQBoardVO faq) throws Exception;

	public void deleteFAQBoard(int faq_num) throws Exception;

	void increaseViewcnt(int faq_num) throws Exception;

	List<FAQBoardVO> selectSearchBoardList() throws Exception;

	List<FAQBoardVO> selectSearchBoardList(SearchCriteria cri) throws Exception;

	int selectSearchBoardCount(SearchCriteria cri) throws Exception;

	void insertFile(Map<String, Object> map) throws Exception;

	int NextSeq() throws SQLException;
}
