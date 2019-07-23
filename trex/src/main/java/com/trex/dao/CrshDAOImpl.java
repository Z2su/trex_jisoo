package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.CrAppVO;
import com.trex.dto.CrshVO;

public class CrshDAOImpl implements CrshDAO {
	
	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<CrshVO> selectList() throws SQLException {
		List<CrshVO> CRSHList = session.selectList("CRSH-Mapper.selectList",null);
		
		return CRSHList;
	}

	@Override
	public CrshVO select(String crsh_code) throws SQLException {
		CrshVO CRSH = session.selectOne("CRSH-Mapper.select",crsh_code);
		
		return CRSH;
	}

	@Override
	public void insert(CrshVO CRSH) throws SQLException {
		session.update("CRSH-Mapper.insert",CRSH);

	}


	@Override
	public void delete(String crsh_code) throws SQLException {
		session.update("CRSH-Mapper.delete", crsh_code);

	}

	@Override
	public int NextSeq() throws SQLException {
		int seq =session.selectOne("CRSH-Mapper.NextSeq");
		return seq;
	}

}
