package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.PfAppVO;

public class PfAppDAOImpl implements PfAppDAO {
	
	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<PfAppVO> selectPFAppList() throws SQLException {
		List<PfAppVO> PfAppList = session.selectList("PFApp-Mapper.selectPFAppList",null);
		System.out.println(">>DAO : "+PfAppList);
		return PfAppList;
	}

	@Override
	public PfAppVO selectPFApp(String pf_app_code) throws SQLException {
		PfAppVO PFAppBoard = session.selectOne("PFApp-Mapper.selectPFApp",pf_app_code);
		
		return PFAppBoard;
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
