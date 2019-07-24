package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CrAppVO;

public interface CrAppDAO {
	
	List<CrAppVO> selectCRAppList() throws SQLException;
	List<CrAppVO> selectCRAppConfList() throws SQLException;
	CrAppVO selectCRApp(String cr_app_code) throws SQLException;
	void enableList(String cr_app_code) throws SQLException;
	
	void insertCRApp(CrAppVO CRApp) throws SQLException;
	void updateCRApp(CrAppVO CRApp) throws SQLException;
	void deleteCRApp(String cr_app_code) throws SQLException;
		
	int selectCRAppNextSeq() throws SQLException;

}
