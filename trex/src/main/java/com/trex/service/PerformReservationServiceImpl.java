package com.trex.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.GroupLayout.SequentialGroup;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.PerformReservationDAO;
import com.trex.dto.PFSHViewVO;
import com.trex.dto.SeatReqVO;

public class PerformReservationServiceImpl implements PerformReservationService{

	@Autowired
	private PerformReservationDAO PFRESEDAO;
	public void setPFRESEDAO(PerformReservationDAO PFRESEDAO) {
		this.PFRESEDAO = PFRESEDAO;
	}
	
	@Override
	public List<PFSHViewVO> getPFSHViewList(String pf_code) throws SQLException {
		List<PFSHViewVO> PFSHViewList = PFRESEDAO.selectPFSHViewList(pf_code);
		return PFSHViewList;
	}

	@Override
	public PFSHViewVO getPFSHView(String pfsh_code) throws SQLException {
		PFSHViewVO PFSHView = PFRESEDAO.selectPFSHView(pfsh_code);
		return PFSHView;
	}

	@Override
	public List<PFSHViewVO> getPFSHViewListByDate(String rundate, String pf_code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rundate", rundate);
		
		map.put("pf_code", pf_code);
		System.out.println("mappppp>>>>"+map);
		
		List<PFSHViewVO> PFSHViewList = PFRESEDAO.selectPFSHViewListBydate(map);
		return PFSHViewList;
	}

	@Override
	public List<SeatReqVO> getSeatCount(String pfsh_code) throws SQLException {

		List<SeatReqVO> SeatReq = PFRESEDAO.selectSeatCount(pfsh_code);
		
		return SeatReq;
	}

	@Override
	public List<SeatReqVO> getSeatList(String pfsh_code) throws SQLException {
		List<SeatReqVO> SeatReqList = PFRESEDAO.selectSeatList(pfsh_code);
		return SeatReqList;
	}
	
	
	

}
