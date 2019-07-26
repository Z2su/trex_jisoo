package com.trex.dao;

import java.sql.SQLException;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.MypageRhVO;

public class MypageRhDAOImpl implements MypageRhDAO {

	@Autowired
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MypageRhVO> selectMemberList() throws SQLException {
		List<MypageRhVO> rhList = session.selectList("MypageRh-Mapper.selectMemberList", null);

		return rhList;
	}

	@Override
	public void deleteMember(String gmem_code) throws SQLException {
		session.delete("MypageRh-Mapper.deleteMember", gmem_code);
	}

	@Override
	public MypageRhVO selectMemberById(String gmem_code) throws SQLException {
		MypageRhVO rh = session.selectOne("MypageRh-Mapper.selectMemberById", gmem_code);
		return rh;
	}
}
