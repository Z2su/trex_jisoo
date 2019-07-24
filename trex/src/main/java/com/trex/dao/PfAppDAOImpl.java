package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.CrAppVO;
import com.trex.dto.PfAppVO;

public class PfAppDAOImpl implements PfAppDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<PfAppVO> selectPFAppList() throws SQLException {
		List<PfAppVO> PfAppList = session.selectList("PFApp-Mapper.selectPFAppList",null);
		
		return PfAppList;
	}

	@Override
	public PfAppVO selectPFApp(String pf_app_code) throws SQLException {
		PfAppVO PFApp = session.selectOne("CRApp-Mapper.selectCRApp",pf_app_code);
		
		return PFApp;
	}

	
	@Override
	public void insertPFApp(PfAppVO PFApp) throws SQLException {
		session.update("PFApp-Mapper.insertPFApp",PFApp);


	}

	@Override
	public void updatePFApp(PfAppVO PFApp) throws SQLException {
		session.update("PFApp-Mapper.updatePFApp",PFApp);

	}

	@Override
	public void deletePFApp(String pf_app_code) throws SQLException {
		session.update("PFApp-Mapper.deletePFApp",pf_app_code);

	}

	@Override
	public int selectPFAppNextSeq() throws SQLException {
		int seq_num = session.selectOne("PFApp-Mapper.selectPFAppNextSeq");
		return seq_num;
	}

}
