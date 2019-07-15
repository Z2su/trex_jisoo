package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.QnAReplyVO;

public class QnAReplyDAOImpl implements QnAReplyDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	private static final String NAMESPACE = "QnAReplyMapper";
	
	@Override
	public QnAReplyVO selectByNum(int rep_num) throws Exception {
		QnAReplyVO reply = session.selectOne(NAMESPACE+".selectByNum", rep_num);
		return reply;
	}

	@Override
	public QnAReplyVO selectByQnACode(String qna_code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertQnARep(QnAReplyVO qnarep) throws Exception {
		session.update(NAMESPACE+".insertQnARep", qnarep);
	}

	@Override
	public List<QnAReplyVO> selectReplyList() throws Exception {
		List<QnAReplyVO> replyList = session.selectList(NAMESPACE+".selectReplyList");
		return replyList;
	}

	@Override
	public int NextSeq() throws SQLException {
		int rep_num = session.selectOne(NAMESPACE + ".NextSeq");
		return rep_num;
	}

	@Override
	public void increaseViewcnt(int rep_num) throws Exception {
		session.update(NAMESPACE+".increaseViewCnt", rep_num);
		
	}

	@Override
	public void updateQnABoard(QnAReplyVO qnarep) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQnABoard(int rep_num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
