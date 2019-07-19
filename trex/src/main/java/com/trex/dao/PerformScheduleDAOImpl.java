package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.PerformScheduleVO;

public class PerformScheduleDAOImpl implements PerformScheduleDAO {
	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<PerformScheduleVO> selectPFSHList() throws SQLException {
		List<PerformScheduleVO> PFSHList = session.selectList("PFSH-Mapper.selectPFSHList");
		return PFSHList;
	}

	@Override
	public List<PerformScheduleVO> selectPFSH(String pf_code) throws SQLException {
		
		List<PerformScheduleVO> PFSHList = session.selectList("PFSH-Mapper.selectPFSH",pf_code);
		return PFSHList;
	}

}
