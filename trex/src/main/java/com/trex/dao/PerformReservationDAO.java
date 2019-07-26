package com.trex.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.trex.dto.PFSHViewVO;
import com.trex.dto.RHVO;
import com.trex.dto.SeatReqVO;
import com.trex.dto.TicketVO;

public interface PerformReservationDAO {
	
	List<PFSHViewVO> selectPFSHViewList(String pf_code) throws SQLException;
	PFSHViewVO selectPFSHView(String pfsh_code) throws SQLException;

	List<PFSHViewVO> selectPFSHViewListBydate(Map<String, Object> map) throws SQLException;
	List<SeatReqVO> selectSeatCount(String pfsh_code) throws SQLException;
	List<SeatReqVO> selectSeatList(String pfsh_code) throws SQLException;
	int selectSeatPrice(Map<String, Object> map) throws SQLException;
	
	void updatePFSHSRESE(Map<String, Object> map) throws SQLException;
	void insertRH(RHVO rh) throws SQLException;
	int selectRHNextSeq() throws SQLException;
	void insertTicket(TicketVO tk) throws SQLException; 
	
}
