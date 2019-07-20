package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CrAppVO;

public interface CrAppService {
	
	List<CrAppVO> getBoardList() throws Exception;
	CrAppVO readBoard(String cr_app_code)throws SQLException;	
	CrAppVO getBoardForModify(String cr_app_code)throws SQLException;	
	
	void write(CrAppVO board) throws SQLException;
	void modify(CrAppVO board) throws SQLException;
	void remove(String cr_app_code) throws SQLException;

}
