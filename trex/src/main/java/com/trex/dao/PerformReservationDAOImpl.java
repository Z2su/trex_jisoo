package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.PFSHViewVO;

public class PerformReservationDAOImpl implements PerformReservationDAO {

	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PFSHViewVO> selectPFSHViewList(String pf_code) throws SQLException {

		List<PFSHViewVO> PFSHView = session.selectList("PFRESE-Mapper.selectPFSHViewList",pf_code);
		
		return PFSHView;
	}

	@Override
	public PFSHViewVO selectPFSHView(String pfsh_code) throws SQLException {
		PFSHViewVO PFSHView = session.selectOne("PFRESE-Mapper.selectPFSHView", pfsh_code);
		
		return PFSHView;
	}

}
