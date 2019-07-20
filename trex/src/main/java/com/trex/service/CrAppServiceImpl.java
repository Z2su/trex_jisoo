package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dao.CrAppDAO;
import com.trex.dto.CrAppVO;

public class CrAppServiceImpl implements CrAppService {
	
	private CrAppDAO CrAppDAO;
	public void setCRAppBoardDAO(CrAppDAO CrAppDAO) {
		this.CrAppDAO = CrAppDAO;
	}

	@Override
	public List<CrAppVO> getBoardList() throws Exception {
		List<CrAppVO> CRAppList = CrAppDAO.selectCRAppList();
		return CRAppList;
	}

	@Override
	public CrAppVO readBoard(String cr_app_code) throws SQLException {
		CrAppVO CRApp = CrAppDAO.selectCRApp(cr_app_code);
		return CRApp;
	}

	@Override
	public CrAppVO getBoardForModify(String cr_app_code) throws SQLException {
		CrAppVO CRApp = CrAppDAO.selectCRApp(cr_app_code);
		
		return CRApp;
	}

	@Override
	public void write(CrAppVO CRAppboard) throws SQLException {
		int num=CrAppDAO.selectCRAppNextSeq();
		
		String code = "APP"+ String.format("%04d", num);
		CRAppboard.setCr_app_num(num);
		CRAppboard.setCr_app_code(code);
		
		CrAppDAO.insertCRApp(CRAppboard);

	}

	@Override
	public void modify(CrAppVO CRAppboard) throws SQLException {
		CrAppDAO.updateCRApp(CRAppboard);

	}

	@Override
	public void remove(String cr_app_code) throws SQLException {
		CrAppDAO.deleteCRApp(cr_app_code);


	}

}
