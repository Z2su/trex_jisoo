package com.trex.service;

import java.sql.SQLException;

import com.trex.dto.MypageMemberVO;

public interface MypageMemberService {

	// 회원정보 조회
	MypageMemberVO getMember(String mem_id) throws SQLException;

	// 회원 수정
	void updateMember(MypageMemberVO mem_id) throws SQLException;

	// 회원 탈퇴
	void deleteMember(String mem_id) throws SQLException;
}