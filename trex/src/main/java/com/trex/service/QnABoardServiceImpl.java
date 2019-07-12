package com.trex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.controller.SearchCriteria;
import com.trex.dao.AttachDAO;
import com.trex.dao.QnABoardDAO;
import com.trex.dto.AttachVO;
import com.trex.dto.QnABoardVO;

public class QnABoardServiceImpl implements QnABoardService {

	@Autowired
	private QnABoardDAO qnaboardDAO;

	public void setQnaboardDAO(QnABoardDAO qnaboardDAO) {
		this.qnaboardDAO = qnaboardDAO;
	}

	@Autowired
	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public void create(QnABoardVO qna) throws Exception {
		int num = qnaboardDAO.NextSeq();

		String code = "QNA" + String.format("%04d", num);
		qna.setQna_code(code);
		qna.setQna_num(num);
		qnaboardDAO.insertQnABoard(qna);
		if (qna.getAttachList() != null) {
			for (AttachVO attach : qna.getAttachList()) {
				attach.setPost_code(code);
				attach.setWirter(qna.getWriter());
				attachDAO.insertAttach(attach);
			}
		}
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

	// @Override
	// public Map<String, Object> alistSearch(SearchCriteria cri) throws Exception {
	// Map<String, Object> qnaMap = new HashMap<String, Object>();
	// List<QnABoardVO> qnalist = qnaboardDAO.selectSearchBoardList(cri);
	// qnaMap.put("qnalist", qnalist);
	// return null;
	// }

}
