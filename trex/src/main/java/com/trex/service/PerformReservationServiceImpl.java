package com.trex.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.PerformReservationDAO;
import com.trex.dao.PerformReservationDAOImpl;
import com.trex.dto.PFSHViewVO;

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
	public List<PFSHViewVO> getPFSHViewListByDate(Date s_rundate, Date e_rundate, String pf_code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("s_rundate", s_rundate);
		map.put("e_rundate", e_rundate);
		map.put("pf_code", pf_code);
		
		
		List<PFSHViewVO> PFSHViewList = PFRESEDAO.selectPFSHViewListBydate(map);
		return PFSHViewList;
	}
	
	
	

}
