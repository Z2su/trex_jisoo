package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.CrAppVO;

public class CrAppDAOImpl implements CrAppDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<CrAppVO> selectCRAppList() throws SQLException {
		List<CrAppVO> CRAppList = session.selectList("CRApp-Mapper.selectCRAppList",null);
		
		return CRAppList;
	}

	@Override
	public CrAppVO selectCRApp(String cr_app_code) throws SQLException {
		CrAppVO CRApp = session.selectOne("CRApp-Mapper.selectCRApp",cr_app_code);
		
		return CRApp;
	}

	@Override
	public void insertCRApp(CrAppVO CRApp) throws SQLException {
		session.update("CRApp-Mapper.insertCRApp",CRApp);

	}

	@Override
	public void updateCRApp(CrAppVO CRApp) throws SQLException {
		session.update("CRApp-Mapper.updateCRApp",CRApp);

	}

	@Override
	public void deleteCRApp(String cr_app_code) throws SQLException {
		session.update("CRApp-Mapper.deleteCRApp",cr_app_code);

	}

	@Override
	public int selectCRAppNextSeq() throws SQLException {
		int seq_num = session.selectOne("CRApp-Mapper.selectCRAppNextSeq");
		return seq_num;
	}

	@Override
	public void enableList(String cr_app_code) throws SQLException {
		session.update("CRApp-Mapper.enableList",cr_app_code);
		
	}

	@Override
	public List<CrAppVO> selectCRAppConfList() throws SQLException {
		List<CrAppVO> CRAppConfList = session.selectList("CRApp-Mapper.selectCRAppConfList",null);
		
		return CRAppConfList;
	}


}
