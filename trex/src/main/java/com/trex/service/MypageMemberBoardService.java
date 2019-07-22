package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageMemberBoardVO;

public interface MypageMemberBoardService {

	public void create(MypageMemberBoardVO qna) throws Exception;

	public MypageMemberBoardVO read(int qna_num) throws Exception;

	public MypageMemberBoardVO readByNum(int qna_num) throws Exception;

	public void modify(MypageMemberBoardVO qna) throws Exception;

	public void remove(int qna_num) throws Exception;

	public List<MypageMemberBoardVO> listSearch(SearchCriteria cri) throws Exception;

	int readSearchMemberBoardCount(SearchCriteria cri) throws Exception;
}
