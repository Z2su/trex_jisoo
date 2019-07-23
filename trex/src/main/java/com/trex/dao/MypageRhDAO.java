package com.trex.dao;

import java.sql.SQLException;

import java.util.List;

import com.trex.dto.MypageRhVO;

public interface MypageRhDAO {
	
	// MypageMemberRhVO 리스트
	List<MypageRhVO> selectMemberList() throws SQLException;

	void deleteMember(String gmem_code)throws SQLException;
	
	MypageRhVO selectMemberById(String gmem_code)throws SQLException;
}
