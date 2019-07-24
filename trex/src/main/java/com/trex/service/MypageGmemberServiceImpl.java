package com.trex.service;

import java.sql.SQLException;

import com.trex.dao.MypageGmemberDAO;
import com.trex.dto.MypageGmemberVO;

public class MypageGmemberServiceImpl implements MypageGmemberService {

	// MypageGmemberDAO
	private MypageGmemberDAO MypageGmemberDAO;

	public void setMypageGmemberDAO(MypageGmemberDAO MypageGmemberDAO) {
		this.MypageGmemberDAO = MypageGmemberDAO;
	}

	@Override
	public MypageGmemberVO getGmember(String mem_code) throws SQLException {
		return MypageGmemberDAO.selectMemberByName(mem_code);
	}

	@Override
	public void modify(MypageGmemberVO gmem) throws Exception {
		MypageGmemberDAO.updateGmember(gmem);
	}

	@Override
	public void remove(String mem_code) throws Exception {
		MypageGmemberDAO.deleteGmember(mem_code);
	}
}