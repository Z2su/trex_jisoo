package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.MypageGmemberVO;

public interface MypageGmemberDAO {

	// GmemberVO 리스트
	List<MypageGmemberVO> selectGmemberList() throws SQLException;

	void updateGmember(MypageGmemberVO gmem)throws SQLException;
	void deleteGmember(String mem_id)throws SQLException;
	
	MypageGmemberVO selectMemberByName(String gmem_code)throws SQLException;
}
