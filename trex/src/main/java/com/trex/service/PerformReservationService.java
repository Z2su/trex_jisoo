package com.trex.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.trex.dto.PFSHViewVO;
import com.trex.dto.RHVO;
import com.trex.dto.SeatReqVO;
import com.trex.dto.TicketVO;

public interface PerformReservationService {

	List<PFSHViewVO> getPFSHViewList(String pf_code) throws SQLException;
	PFSHViewVO getPFSHView(String pfsh_code) throws SQLException;
	List<PFSHViewVO> getPFSHViewListByDate(String rundate,String pf_code) throws SQLException;	

	List<SeatReqVO> getSeatCount(String pfsh_code) throws SQLException;
	List<SeatReqVO> getSeatList(String pfsh_code) throws SQLException;
	
	int getSeatPrice(String seat_code, String pfsh_code) throws SQLException;
	
	void updatePFSHSRESE(String seat_code, String pfsh_code) throws SQLException;
	String insertRH(RHVO rh) throws SQLException;
	void insertTicket(TicketVO tk) throws SQLException;
}
