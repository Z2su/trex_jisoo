package com.trex.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.trex.dto.PFSHViewVO;

public interface PerformReservationService {

	List<PFSHViewVO> getPFSHViewList(String pf_code) throws SQLException;
	PFSHViewVO getPFSHView(String pfsh_code) throws SQLException;
	List<PFSHViewVO> getPFSHViewListByDate(Date s_rundate, Date e_rundate, String pf_code) throws SQLException;	
}
