package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PfAppVO;

public interface PfAppService {
	
	List<PfAppVO> getBoardList() throws Exception;
	PfAppVO readBoard(String pf_app_code)throws SQLException;	
	PfAppVO getBoardForModify(String pf_app_code)throws SQLException;	
	
	void write(PfAppVO board)throws SQLException;
	void modify(PfAppVO board)throws SQLException;
	void remove(String pf_app_code)throws SQLException;

}
