package com.trex.service;

import java.sql.SQLException;

import com.trex.dto.MypageMemberVO;

public interface MypageMemberService {

	// 회원정보 조회
	MypageMemberVO getMember(String mem_id) throws SQLException;

	// 회원 수정
	void modify(String mem_id) throws SQLException;

	// 회원 탈퇴
	void remove(String mem_id) throws SQLException;
}