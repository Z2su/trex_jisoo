package com.trex.service;

import java.sql.SQLException;

import com.trex.dao.MypageMemberDAO;
import com.trex.dto.MypageMemberVO;

public class MypageMemberServiceImpl implements MypageMemberService {

	// MypageMemberDAO
	private MypageMemberDAO MypageMemberDAO;

	public void setMypageMemberDAO(MypageMemberDAO MypageMemberDAO) {
		this.MypageMemberDAO = MypageMemberDAO;
	}

	@Override
	public MypageMemberVO getMember(String mem_id) throws SQLException {
		return MypageMemberDAO.selectMemberById(mem_id);
	}

	@Override
	public void modify(String mem_id) throws SQLException {
		MypageMemberDAO.updateMember(mem_id);	
	}

	@Override
	public void remove(String mem_id) throws SQLException {
		MypageMemberDAO.deleteMember(mem_id);
	}
}