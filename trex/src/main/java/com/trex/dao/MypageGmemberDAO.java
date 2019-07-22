package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.MypageGmemberVO;

public interface MypageGmemberDAO {

	// GmemberVO 리스트
	List<MypageGmemberVO> selectGmemberList() throws SQLException;

	void updateGmember(String gmem_code)throws SQLException;
	void deleteGmember(String gmem_code)throws SQLException;
	
	MypageGmemberVO selectMemberByName(String gmem_code)throws SQLException;
}
