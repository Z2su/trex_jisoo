package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.CrAppVO;
import com.trex.dto.CrConfVO;

public class CrConfDAOImpl implements CrConfDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<CrConfVO> selectCrConfList() throws SQLException {
		List<CrConfVO> CrConfList = session.selectList("CrConf-Mapper.selectCrConfList",null);
		
		return CrConfList;
	}

	@Override
	public CrConfVO selectCrConf(String conf_code) throws SQLException {
		CrConfVO CrConf = session.selectOne("CrConf-Mapper.selectCrConf",conf_code);
		
		return CrConf;
	}

	@Override
	public void insertCrConf(CrConfVO CrConf) throws SQLException {
		session.update("CrConf-Mapper.insertCrConf",CrConf);

	}

	@Override
	public void updateCrConf(CrConfVO CrConf) throws SQLException {
		session.update("CrConf-Mapper.updateCrConf",CrConf);

	}

	@Override
	public void deleteCrConf(String conf_code) throws SQLException {
		session.update("CrConf-Mapper.deleteCrConf",conf_code);

	}

	@Override
	public int selectConfNextSeq() throws SQLException {
		int seq_num = session.selectOne("CrConf-Mapper.selectConfNextSeq");
		return seq_num;
	}

}
