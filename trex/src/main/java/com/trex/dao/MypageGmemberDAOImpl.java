package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.MypageGmemberVO;

public class MypageGmemberDAOImpl implements MypageGmemberDAO {

	private SqlSession session;

	// @Autowired
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MypageGmemberVO> selectGmemberList() throws SQLException {
		List<MypageGmemberVO> gmemberList = session.selectList("MypageGmember-Mapper.selectGmemberList", null);

		return gmemberList;
	}

	@Override
	public void updateGmember(String gmem_code) throws SQLException {
		session.update("MypageGmember-Mapper.updateGmember", gmem_code);
	}

	@Override
	public void deleteGmember(String gmem_code) throws SQLException {
		session.update("MypageGmember-Mapper.deleteMember", gmem_code);
	}

	@Override
	public MypageGmemberVO selectMemberByName(String mem_code) throws SQLException {
		MypageGmemberVO gmem = session.selectOne("MypageGmember-Mapper.selectMemberByName", mem_code);

		return gmem;
	}
}
