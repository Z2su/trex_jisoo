package com.trex.service;

import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.List;

import com.trex.dao.PerformScheduleDAO;
import com.trex.dto.PerformScheduleVO;

public class PerformScheduleServiceImpl implements PerformScheduleService {

	private PerformScheduleDAO PFSHDAO;
	public void setPFSHDAO(PerformScheduleDAO PFSHDAO) {
		this.PFSHDAO = PFSHDAO;
	}
	@Override
	public List<PerformScheduleVO> getPFSHList() throws SQLException {
		List<PerformScheduleVO> PFSHList = PFSHDAO.selectPFSHList();
		return PFSHList;
	}

	@Override
	public List<PerformScheduleVO> getPFSH(String pf_code) throws SQLException {
		// TODO Auto-generated method stub
		List<PerformScheduleVO> PFSHList = PFSHDAO.selectPFSH(pf_code);
		return PFSHList;
	}

}
