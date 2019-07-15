package com.trex.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.trex.controller.SearchCriteria;
import com.trex.dao.AttachDAO;
import com.trex.dao.QnABoardDAO;
import com.trex.dto.AttachVO;
import com.trex.dto.QnABoardVO;

public class QnABoardServiceImpl implements QnABoardService {

	Logger log = Logger.getLogger(this.getClass());

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

	@Override
	public List<QnABoardVO> listSearch() throws Exception {

		List<QnABoardVO> qnalist = qnaboardDAO.selectSearchBoardList();

		return qnalist;
	}

	@Override
	public void create(QnABoardVO qna) throws Exception {
		int qna_num = qnaboardDAO.NextSeq();
		String qna_code = "QNA" + String.format("%04d", qna_num);
		qna.setQna_code(qna_code);
		qna.setQna_num(qna_num);
		qnaboardDAO.insertQnABoard(qna);

		/*if(qna.getAttachList()!=null) {
			for(AttachVO attach:qna.getAttachList()) {
				attach.setAttach_code(qna_code);
				attach.setAttach_num(qna_num);
				attach.setWirter(qna.getWriter());
				attach.setPost_code(qna_code);
				attachDAO.insertAttach(attach);
			}
		}
		*/

	}

	@Override
	public Map<String, Object> getList(SearchCriteria cri) throws Exception {
		List<QnABoardVO> qnaList = qnaboardDAO.selectSearchBoardList(cri);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("qnaList", qnaList);

		return dataMap;
	}

	@Override
	public void create() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(QnABoardVO qna, HttpServletRequest request) throws Exception {

		int qna_num = qnaboardDAO.NextSeq();
		String qna_code = "QNA" + String.format("%04d", qna_num);
		qna.setQna_code(qna_code);
		qna.setQna_num(qna_num);
		qnaboardDAO.insertQnABoard(qna);

		}
		
	

}
