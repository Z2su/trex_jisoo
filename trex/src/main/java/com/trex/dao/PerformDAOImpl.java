package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.PerformVO;

public class PerformDAOImpl implements PerformDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<PerformVO> selectPFList() throws SQLException {
		List<PerformVO> PFList = session.selectList("PF-Mapper.selectPFList");
		return PFList;
	}

	@Override
	public PerformVO selectPF(String pf_code) throws SQLException {
		PerformVO PF = session.selectOne("PF-Mapper.selectPF",pf_code);
		return PF;
	}

}
