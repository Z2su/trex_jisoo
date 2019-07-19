package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CoronationVO;
import com.trex.dto.NoticeVO;

public interface CoronationService {
	
	List<CoronationVO> getBoardList() throws Exception;
	CoronationVO readBoard(String crg_code)throws SQLException;	
	CoronationVO getBoardForModify(String crg_code)throws SQLException;	
	
	void write(CoronationVO board)throws SQLException;
	void modify(CoronationVO board)throws SQLException;
	void remove(String crg_code)throws SQLException;

}
