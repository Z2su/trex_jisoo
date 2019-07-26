package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CrConfVO;

public interface CrConfDAO {
	
	List<CrConfVO> selectCrConfList() throws SQLException;
	CrConfVO selectCrConf(String conf_code) throws SQLException;
	
	void insertCrConf(CrConfVO CrConf) throws SQLException;
	void updateCrConf(CrConfVO CrConf) throws SQLException;
	void deleteCrConf(String conf_code) throws SQLException;
		
	int selectConfNextSeq() throws SQLException;

}
