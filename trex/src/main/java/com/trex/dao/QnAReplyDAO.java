package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.QnAReplyVO;

public interface QnAReplyDAO {

	QnAReplyVO selectByNum(int rep_num) throws Exception;
	QnAReplyVO selectByQnACode(String qna_code) throws Exception;
	
	void insertQnARep(QnAReplyVO qnarep) throws Exception;

	List<QnAReplyVO> selectReplyList() throws Exception;
	void increaseViewcnt(int rep_num) throws Exception;
	void updateQnAReply(QnAReplyVO qnarep) throws Exception;
	void deleteQnAReply(int rep_num) throws Exception;
	
/*




	List<QnABoardVO> selectSearchBoardList(SearchCriteria cri) throws Exception;

	int selectSearchBoardCount(SearchCriteria cri) throws Exception;
*/
	
	int NextSeq() throws SQLException;
}
