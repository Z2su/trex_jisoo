package com.trex.service;

import java.sql.SQLException;

import com.trex.dto.MypageTroupeVO;

public interface MypageTroupeService {
	
	//공연단 정보 조회
	MypageTroupeVO gettroupe(String tro_code) throws SQLException;

	// 공연단 정보 수정
	void modify(MypageTroupeVO member) throws SQLException;

	// 회원탈퇴
	void remove(String pwd) throws SQLException;
}
