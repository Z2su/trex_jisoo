package com.trex.dao;

import java.sql.SQLException;

import java.util.List;

import com.trex.dto.MypageTroupeCrAppListVO;

public interface MypageTroupeCrAppDAO {

    List<MypageTroupeCrAppListVO> selectCRAppList() throws SQLException;
	MypageTroupeCrAppListVO selectCRApp(String cr_app_code) throws SQLException;
	
	void insertCRApp(MypageTroupeCrAppListVO CRApp) throws SQLException;
	void updateCRApp(MypageTroupeCrAppListVO CRApp) throws SQLException;
	void deleteCRApp(String cr_app_code) throws SQLException;
		
	int selectCRAppNextSeq() throws SQLException;
}
