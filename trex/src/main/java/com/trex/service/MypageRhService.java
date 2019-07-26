package com.trex.service;

import java.sql.SQLException;

import com.trex.dto.MypageRhVO;

public interface MypageRhService {

		// 예매내역 조회
		MypageRhVO getMember(String gmem_code) throws SQLException;

		// 예매 취소
		void deleteMember(String gmem_code) throws SQLException;
}
