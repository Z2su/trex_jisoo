package com.trex.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.controller.SearchCriteria;
import com.trex.dto.FAQBoardVO;

public class FAQBoardDAOImpl implements FAQBoardDAO {
@Autowired
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private static final String NAMESPACE = "FAQBoardMapper";

	@Override
	public void insertFAQBoard(FAQBoardVO faq) throws Exception {
		session.update(NAMESPACE + ".insertFAQBoard", faq);

	}

	@Override
	public FAQBoardVO selectBoardByNum(int faq_num) throws Exception {
		FAQBoardVO faq = (FAQBoardVO) session.selectOne(NAMESPACE + ".selectBoardByNum", faq_num);
		return faq;
	}

	@Override
	public void updateFAQBoard(FAQBoardVO faq) throws Exception {
		session.update(NAMESPACE + ".updateFAQBoard", faq);

	}

	@Override
	public void deleteFAQBoard(int faq_num) throws Exception {
		session.update(NAMESPACE + ".deleteFAQBoard", faq_num);

	}

	@Override
	public void increaseViewcnt(int faq_num) throws Exception {
		session.update(NAMESPACE + ".increaseViewCnt", faq_num);

	}

	@Override
	public List<FAQBoardVO> selectSearchBoardList(SearchCriteria cri) throws Exception {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<FAQBoardVO> boardList = session.selectList(NAMESPACE + ".selectSearchBoardList", cri, rowBounds);
		return boardList;
	}

	@Override
	public int selectSearchBoardCount(SearchCriteria cri) throws Exception {
		int rowCount = session.selectOne(NAMESPACE + ".selectSearchBoardCount", cri);
		return rowCount;
	}

	@Override
	public int NextSeq() throws SQLException {
		int seq_num = session.selectOne(NAMESPACE + ".NextSeq");
		return seq_num;

	}

	@Override
	public List<FAQBoardVO> selectSearchBoardList() throws Exception {
		List<FAQBoardVO> boardList = session.selectList(NAMESPACE + ".selectSearchBoardList");
		return boardList;
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		session.update("AttachMapper.insertAttach");

	}

}