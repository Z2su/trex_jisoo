package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.PfAppDAO;
import com.trex.dto.PfAppVO;

public class PfAppServiceImpl implements PfAppService {
	
	@Autowired
	private PfAppDAO PfAppDAO;
	public void setPfAppDAO(PfAppDAO PfAppDAO) {
		this.PfAppDAO = PfAppDAO;
	}

	@Override
	public List<PfAppVO> getBoardList() throws Exception {
		List<PfAppVO> PFAppList = PfAppDAO.selectPFAppList();
		
		System.out.println("service>>"+PFAppList);
		return PFAppList;
	}

	@Override
	public PfAppVO readBoard(String pf_app_code) throws SQLException {
		PfAppVO PFApp = PfAppDAO.selectPFApp(pf_app_code);
		return PFApp;
	}

	@Override
	public PfAppVO getBoardForModify(String pf_app_code) throws SQLException {
		PfAppVO PFApp = PfAppDAO.selectPFApp(pf_app_code);
		
		return PFApp;
	}

	@Override
	public void write(PfAppVO board) throws SQLException {
	int num=PfAppDAO.selectPFAppNextSeq();
		
		String code = "PAPP"+ String.format("%04d", num);
		board.setPf_app_num(num);
		board.setPf_app_code(code);
		
		PfAppDAO.insertPFApp(board);
	}

	@Override
	public void modify(PfAppVO board) throws SQLException {
		PfAppDAO.updatePFApp(board);

	}

	@Override
	public void remove(String pf_app_code) throws SQLException {
		PfAppDAO.deletePFApp(pf_app_code);

	}

}
