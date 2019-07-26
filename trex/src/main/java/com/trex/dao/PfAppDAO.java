package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PfAppVO;

public interface PfAppDAO {
	
	List<PfAppVO> selectPFAppList() throws SQLException;
	PfAppVO selectPFApp(String pf_app_code) throws SQLException;
	
	void insertPFApp(PfAppVO PFApp) throws SQLException;
	void updatePFApp(PfAppVO PFApp) throws SQLException;
	void deletePFApp(String pf_app_code) throws SQLException;
		
	int selectPFAppNextSeq() throws SQLException;

}
