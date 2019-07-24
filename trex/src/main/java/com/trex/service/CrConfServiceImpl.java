package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dao.CrConfDAO;
import com.trex.dto.CrConfVO;

public class CrConfServiceImpl implements CrConfService {
	
	private CrConfDAO CrConfDAO;
	public void setCrConfBoardDAO(CrConfDAO CrConfDAO) {
		this.CrConfDAO = CrConfDAO;
	}

	@Override
	public List<CrConfVO> getBoardList() throws Exception {
		List<CrConfVO> CrConfList = CrConfDAO.selectCrConfList();
		return CrConfList;
	}

	@Override
	public CrConfVO readBoard(String conf_code) throws SQLException {
		CrConfVO CrConf = CrConfDAO.selectCrConf(conf_code);
		return CrConf;
	}

	@Override
	public CrConfVO getBoardForModify(String conf_code) throws SQLException {
		CrConfVO CrConf = CrConfDAO.selectCrConf(conf_code);
		
		return CrConf;
	}

	@Override
	public void write(CrConfVO CrConf) throws SQLException {
		int num=CrConfDAO.selectConfNextSeq();
		
		String code = "CONF"+ String.format("%04d", num);
		CrConf.setConf_num(num);
		CrConf.setConf_code(code);
		
		CrConfDAO.insertCrConf(CrConf);

	}

	@Override
	public void modify(CrConfVO CrConf) throws SQLException {
		CrConfDAO.updateCrConf(CrConf);

	}

	@Override
	public void remove(String conf_code) throws SQLException {
		CrConfDAO.deleteCrConf(conf_code);

	}

}
