package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.HallVO;

public interface HallDAO {
	
	List<HallVO> selectHallList() throws SQLException;
	HallVO selectHall(String hall_code) throws SQLException;
	
	void insertHall(HallVO hall) throws SQLException;
	void updateHall(HallVO hall) throws SQLException;
	void deleteHall(String hall_code) throws SQLException;
		
	int selectHallNextSeq() throws SQLException;

}
