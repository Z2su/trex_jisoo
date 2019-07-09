package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dao.QnABoardDAO;
import com.trex.dto.QnABoardVO;

public class QnABoardServiceImpl implements QnABoardService {

	private QnABoardDAO qnaboardDAO;

	public void setQnaboardDAO(QnABoardDAO qnaboardDAO) {
		this.qnaboardDAO = qnaboardDAO;
	}

	@Override
	public void create(QnABoardVO qna) throws Exception {
		qnaboardDAO.insertQnABoard(qna);

	}

	@Override
	public QnABoardVO read(int qna_num) throws Exception {
		QnABoardVO qnaboard = qnaboardDAO.selectBoardByNum(qna_num);
		qnaboardDAO.increaseViewcnt(qna_num);
		return qnaboard;
	}

	@Override
	public QnABoardVO readByNum(int qna_num) throws Exception {
		QnABoardVO qnaboard = qnaboardDAO.selectBoardByNum(qna_num);

		return qnaboard;
	}

	@Override
	public void modify(QnABoardVO qna) throws Exception {
		qnaboardDAO.updateQnABoard(qna);
	}

	@Override
	public void remove(int qna_num) throws Exception {
		qnaboardDAO.deleteQnABoard(qna_num);
	}

	@Override
	public List<QnABoardVO> listSearch(SearchCriteria cri) throws Exception {
		List<QnABoardVO> qnalist = qnaboardDAO.selectSearchBoardList(cri);
		return qnalist;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws Exception {
		int count = qnaboardDAO.selectSearchBoardCount(cri);
		return count;
	}

}
