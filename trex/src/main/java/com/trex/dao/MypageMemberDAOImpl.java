package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trex.dto.MypageMemberVO;

@Repository
public class MypageMemberDAOImpl implements MypageMemberDAO {
	
	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MypageMemberVO> selectMemberList() throws SQLException {
		List<MypageMemberVO> memberList = session.selectList("MypageMember-Mapper.selectMemberList", null);

		return memberList;
	}

	@Override
	public void updateMember(MypageMemberVO mem_id) throws SQLException {
		session.update("MypageMember-Mapper.updateMember", mem_id);
	}

	@Override
	public void deleteMember(String mem_id) throws SQLException {
		session.delete("MypageMember-Mapper.deleteMember", mem_id);
	}

	@Override
	public MypageMemberVO selectMemberById(String mem_id) throws SQLException {
		MypageMemberVO member = session.selectOne("MypageMember-Mapper.selectMemberById", mem_id);
		return member;
	}
}
