package com.trex.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageMemberBoardVO;

public class MypageMemberBoardDAOImpl implements MypageMemberBoardDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private static final String NAMESPACE = "MypageMemberBoardMapper";

	@Override
	public void insertMemberBoard(MypageMemberBoardVO qna) throws Exception {
		session.update(NAMESPACE + ".insertQnABoard", qna);
	}

	@Override
	public MypageMemberBoardVO selectMemberBoardByNum(int qna_num) throws Exception {
		MypageMemberBoardVO qna = (MypageMemberBoardVO) session.selectOne(NAMESPACE + ".selectBoardByNum", qna_num);
		return qna;
	}

	@Override
	public void updateMemberBoard(MypageMemberBoardVO qna) throws Exception {
		session.update(NAMESPACE + ".updateQnABoard", qna);
	}

	@Override
	public void deleteMemberBoard(int qna_num) throws Exception {
		session.update(NAMESPACE + ".deleteQnABoard", qna_num);
	}

	@Override
	public void increaseViewcnt(int qna_num) throws Exception {
		session.update(NAMESPACE + ".increaseViewCnt", qna_num);
	}

	@Override
	public List<MypageMemberBoardVO> selectSearchMemberBoardList(SearchCriteria cri) throws Exception {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<MypageMemberBoardVO> boardList = session.selectList(NAMESPACE + ".selectSearchMemberBoardList", cri,
				rowBounds);
		return boardList;
	}

	@Override
	public int selectSearchMemberBoardCount(SearchCriteria cri) throws Exception {
		int rowCount = session.selectOne(NAMESPACE + ".selectSearchMemberBoardCount", cri);
		return rowCount;
	}
}