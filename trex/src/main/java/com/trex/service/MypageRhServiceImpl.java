package com.trex.service;

import java.sql.SQLException;

import com.trex.dao.MypageRhDAO;
import com.trex.dto.MypageRhVO;

public class MypageRhServiceImpl implements MypageRhService {
	
	// MypageMemberDAO
	private MypageRhDAO MypageRhDAO;

	public void setMypageRhDAO(MypageRhDAO MypageRhDAO) {
		this.MypageRhDAO = MypageRhDAO;
	}
	
	@Override
	public MypageRhVO getMember(String gmem_code) throws SQLException {
		return MypageRhDAO.selectMemberById(gmem_code);
	}

	@Override
	public void deleteMember(String gmem_code) throws SQLException {
		MypageRhDAO.deleteMember(gmem_code);
	}
}
