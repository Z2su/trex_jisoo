package com.trex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.QnAReplyDAO;
import com.trex.dto.QnABoardVO;
import com.trex.dto.QnAReplyVO;

public class QnAReplyServiceImpl implements QnAReplyService {

	@Autowired
	private QnAReplyDAO qnareplyDAO;
	
	public void setQnareplyDAO(QnAReplyDAO qnareplyDAO) {
		this.qnareplyDAO = qnareplyDAO;
	}
	
	@Override
	public void create() throws Exception {
		
	}

	@Override
	public void create(QnAReplyVO qnarep, String qna_code) throws Exception {
		
		int rep_num = qnareplyDAO.NextSeq();
		String rep_code = "REP" + String.format("%04d", rep_num);
		qnarep.setRep_code(rep_code);
		qnarep.setRep_num(rep_num);
		qnarep.setQna_code(qna_code);
		qnareplyDAO.insertQnARep(qnarep);
		
	}

	@Override
	public QnAReplyVO read(int rep_num) throws Exception {
		QnAReplyVO reply = qnareplyDAO.selectByNum(rep_num);
		qnareplyDAO.increaseViewcnt(rep_num);
		return reply;
	}

	@Override
	public QnAReplyVO readByNum(int rep_num) throws Exception {
		QnAReplyVO reply = qnareplyDAO.selectByNum(rep_num);
		return reply;
	}

	@Override
	public void modify(QnAReplyVO reply) throws Exception {
		qnareplyDAO.updateQnAReply(reply);

	}

	@Override
	public void remove(int rep_num) throws Exception {
		qnareplyDAO.deleteQnAReply(rep_num);

	}

	@Override
	public List<QnAReplyVO> listSearch() throws Exception {
		List<QnAReplyVO> replist = qnareplyDAO.selectReplyList();

		return replist;
	}

}
