package com.trex.dao;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageMemberBoardVO;

public interface MypageMemberBoardDAO {

	public void insertMemberBoard(MypageMemberBoardVO qna)throws Exception;
	public MypageMemberBoardVO selectMemberBoardByNum(int qna_num)throws Exception;
	public void updateMemberBoard(MypageMemberBoardVO qna)throws Exception;
	public void deleteMemberBoard(int qna_num)throws Exception;
	
	void increaseViewcnt(int qna_num) throws Exception;
			
	List<MypageMemberBoardVO> selectSearchMemberBoardList(SearchCriteria cri) throws Exception;
	int selectSearchMemberBoardCount(SearchCriteria cri) throws Exception;
}
