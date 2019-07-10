package com.trex.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.trex.controller.SearchCriteria;
import com.trex.dto.QnABoardVO;

public class QnABoardDAOImpl implements QnABoardDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	private static final String NAMESPACE="QnABoardMapper";
	@Override
	public void insertQnABoard(QnABoardVO qna) throws Exception {
	session.update(NAMESPACE+".insertQnABoard", qna);
		
	}

	@Override
	public QnABoardVO selectBoardByNum(int qna_num) throws Exception {
		QnABoardVO qna=
				(QnABoardVO)session.selectOne(NAMESPACE+".selectBoardByNum",qna_num);
		return qna;
	}

	@Override
	public void updateQnABoard(QnABoardVO qna) throws Exception {
		session.update(NAMESPACE+".updateQnABoard",qna);
		
	}

	@Override
	public void deleteQnABoard(int qna_num) throws Exception {
		session.update(NAMESPACE+".deleteQnABoard",qna_num);
		
	}

	@Override
	public void increaseViewcnt(int qna_num) throws Exception {
		session.update(NAMESPACE+".increaseViewCnt",qna_num);
		
	}

	@Override
	public List<QnABoardVO> selectSearchBoardList(SearchCriteria cri) throws Exception {
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<QnABoardVO> boardList=
		session.selectList(NAMESPACE+".selectSearchBoardList",cri,rowBounds);
		return boardList;
	}

	@Override
	public int selectSearchBoardCount(SearchCriteria cri) throws Exception {
		int rowCount = 
				session.selectOne(NAMESPACE+".selectSearchBoardCount",cri);
		return rowCount;
	}
	
	
}
