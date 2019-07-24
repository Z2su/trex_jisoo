package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dao.MypageMemberBoardDAO;
import com.trex.dto.MypageMemberBoardVO;

public class MypageMemberBoardServiceImpl implements MypageMemberBoardService {

	private MypageMemberBoardDAO mypagememberbdordDAO;

	public void setMypageMemberboardDAO(MypageMemberBoardDAO mypagememberbdordDAO) {
		this.mypagememberbdordDAO = mypagememberbdordDAO;
	}

	@Override
	public void create(MypageMemberBoardVO qna) throws Exception {
		mypagememberbdordDAO.insertMemberBoard(qna);
	}

	@Override
	public MypageMemberBoardVO read(int qna_num) throws Exception {
		MypageMemberBoardVO Memberboard = mypagememberbdordDAO.selectMemberBoardByNum(qna_num);
		mypagememberbdordDAO.increaseViewcnt(qna_num);
		return Memberboard;
	}

	@Override
	public MypageMemberBoardVO readByNum(int qna_num) throws Exception {
		MypageMemberBoardVO Memberboard = mypagememberbdordDAO.selectMemberBoardByNum(qna_num);

		return Memberboard;
	}

	@Override
	public void modify(MypageMemberBoardVO qna) throws Exception {
		mypagememberbdordDAO.updateMemberBoard(qna);
	}

	@Override
	public void remove(int qna_num) throws Exception {
		mypagememberbdordDAO.deleteMemberBoard(qna_num);
	}

	@Override
	public List<MypageMemberBoardVO> listSearch(SearchCriteria cri) throws Exception {
		List<MypageMemberBoardVO> qnalist = mypagememberbdordDAO.selectSearchMemberBoardList(cri);
		return qnalist;
	}

	@Override
	public int readSearchMemberBoardCount(SearchCriteria cri) throws Exception {
		int count = mypagememberbdordDAO.selectSearchMemberBoardCount(cri);
		return count;
	}

}
