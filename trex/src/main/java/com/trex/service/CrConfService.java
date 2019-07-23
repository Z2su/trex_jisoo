package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CrConfVO;

public interface CrConfService {
	
	List<CrConfVO> getBoardList() throws Exception;
	CrConfVO readBoard(String conf_code)throws SQLException;	
	CrConfVO getBoardForModify(String conf_code)throws SQLException;	
	
	void write(CrConfVO CrConf) throws SQLException;
	void modify(CrConfVO CrConf) throws SQLException;
	void remove(String conf_code) throws SQLException;

}
