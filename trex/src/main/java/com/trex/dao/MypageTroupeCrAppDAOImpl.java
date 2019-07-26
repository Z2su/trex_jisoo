package com.trex.dao;

import java.sql.SQLException;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.MypageTroupeCrAppListVO;

public class MypageTroupeCrAppDAOImpl implements MypageTroupeCrAppDAO {
	

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MypageTroupeCrAppListVO> selectCRAppList() throws SQLException {
		List<MypageTroupeCrAppListVO> CRAppList = session.selectList("MypageTroupeCrApp-Mapper.selectCRAppList", null);

		return CRAppList;
	}

	@Override
	public MypageTroupeCrAppListVO selectCRApp(String cr_app_code) throws SQLException {
		MypageTroupeCrAppListVO CRApp = session.selectOne("MypageTroupeCrApp-Mapper.selectCRApp", cr_app_code);

		return CRApp;
	}

	@Override
	public void insertCRApp(MypageTroupeCrAppListVO CRApp) throws SQLException {
		session.update("MypageTroupeCrApp-Mapper.insertCRApp", CRApp);
	}

	@Override
	public void updateCRApp(MypageTroupeCrAppListVO CRApp) throws SQLException {
		session.update("MypageTroupeCrApp-Mapper.updateCRApp", CRApp);
	}

	@Override
	public void deleteCRApp(String cr_app_code) throws SQLException {
		session.update("MypageTroupeCrApp-Mapper.deleteCRApp", cr_app_code);
	}

	@Override
	public int selectCRAppNextSeq() throws SQLException {
		int seq_num = session.selectOne("MypageTroupeCrApp-Mapper.selectCRAppNextSeq");
		
		return seq_num;
	}
}
