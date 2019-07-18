package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PFSHViewVO;

public interface PerformReservationService {

	List<PFSHViewVO> getPFSHViewList(String pf_code) throws SQLException;
	PFSHViewVO getPFSHView(String pfsh_code) throws SQLException;
	
}
