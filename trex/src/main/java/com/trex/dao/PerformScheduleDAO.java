package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PerformScheduleVO;

public interface PerformScheduleDAO {
	List<PerformScheduleVO> selectPFSHList() throws SQLException;
	List<PerformScheduleVO> selectPFSH(String pf_code) throws SQLException;
	
}
