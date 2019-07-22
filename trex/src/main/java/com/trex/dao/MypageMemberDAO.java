package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.MypageMemberVO;

public interface MypageMemberDAO {

	// MemberVO 리스트
	List<MypageMemberVO> selectMemberList() throws SQLException;
	
	// 회원 수정
	void updateMember(String mem_id)throws SQLException;
	
	// 회원 탈퇴
	void deleteMember(String mem_id)throws SQLException;
	
	MypageMemberVO selectMemberById(String mem_id)throws SQLException;
}
