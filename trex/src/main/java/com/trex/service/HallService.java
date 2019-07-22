package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.HallVO;

public interface HallService {
	
	List<HallVO> getBoardList() throws Exception;
	HallVO readBoard(String hall_code)throws SQLException;	
	HallVO getBoardForModify(String hall_code)throws SQLException;	
	
	void write(HallVO hall) throws SQLException;
	void modify(HallVO hall) throws SQLException;
	void remove(String hall_code) throws SQLException;

}
