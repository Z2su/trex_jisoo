package com.trex.service;

import java.sql.SQLException;

import com.trex.dto.MypageGmemberVO;

public interface MypageGmemberService {

	// 회원정보 조회
	MypageGmemberVO getGmember(String mem_code) throws SQLException;

	// 회원정보 수정
	void modify(String mem_code) throws SQLException;

	// 회원 탈퇴
	void remove(String mem_code) throws SQLException;
}