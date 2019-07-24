package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PerformScheduleVO;

public interface PerformScheduleService {
	
	List<PerformScheduleVO> getPFSHList() throws SQLException;
	List<PerformScheduleVO> getPFSH(String pf_code) throws SQLException;
	
	

}
