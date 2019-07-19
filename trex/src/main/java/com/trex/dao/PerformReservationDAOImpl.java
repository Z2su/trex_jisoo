package com.trex.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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

		List<PFSHViewVO> PFSHViewList = session.selectList("PFRESE-Mapper.selectPFSHViewList",pf_code);
		
		return PFSHViewList;
	}

	@Override
	public PFSHViewVO selectPFSHView(String pfsh_code) throws SQLException {
		PFSHViewVO PFSHView = session.selectOne("PFRESE-Mapper.selectPFSHView", pfsh_code);
		
		return PFSHView;
	}

	@Override
	public List<PFSHViewVO> selectPFSHViewListBydate(Map<String, Object> map) throws SQLException {
		
		
		List<PFSHViewVO> PFSHViewList = session.selectList("PFRESE-Mapper.selectPFSHViewListBydate",map);

		
		return PFSHViewList;
	}

}
