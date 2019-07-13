package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.QnABoardVO;


public interface QnABoardDAO {
	
	
	public void insertQnABoard(QnABoardVO qna)throws Exception;
	public QnABoardVO selectBoardByNum(int qna_num)throws Exception;
	public void updateQnABoard(QnABoardVO qna)throws Exception;
	public void deleteQnABoard(int qna_num)throws Exception;
	
	void increaseViewcnt(int qna_num) throws Exception;
			
	List<QnABoardVO> selectSearchBoardList(SearchCriteria cri) throws Exception;
	int selectSearchBoardCount(SearchCriteria cri) throws Exception;
	
	int NextSeq() throws SQLException;
}
