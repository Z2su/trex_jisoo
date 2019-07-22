package com.trex.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.trex.dto.PFSHViewVO;
import com.trex.dto.SeatReqVO;

public interface PerformReservationService {

	List<PFSHViewVO> getPFSHViewList(String pf_code) throws SQLException;
	PFSHViewVO getPFSHView(String pfsh_code) throws SQLException;
	List<PFSHViewVO> getPFSHViewListByDate(String rundate,String pf_code) throws SQLException;	

	List<SeatReqVO> getSeatCount(String pfsh_code) throws SQLException;
	List<SeatReqVO> getSeatList(String pfsh_code) throws SQLException;
}
