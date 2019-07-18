package com.trex.service;

import java.sql.SQLException;
import java.util.List;

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
	
	
	

}
