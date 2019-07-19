package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.PerformDAO;
import com.trex.dto.PerformVO;

public class PerformServiceImpl implements PerformService {

	@Autowired
	private PerformDAO performDAO;
	public void setPerformDAO(PerformDAO performDAO) {
		this.performDAO = performDAO;
	}
	
	@Override
	public List<PerformVO> getPFList() throws SQLException {
		List<PerformVO> PFList = performDAO.selectPFList();
		return PFList;
	}

	@Override
	public PerformVO getPF(String pf_code) throws SQLException {
		PerformVO PF = performDAO.selectPF(pf_code);
		return PF;
	}

}
