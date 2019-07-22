package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dao.MypageTroupeCrAppDAO;

import com.trex.dto.MypageTroupeCrAppListVO;


public class MypageTroupeCrAppServiceImpl implements MypageTroupeCrAppService {

	private MypageTroupeCrAppDAO MypageTroupeCrAppDAO;

	public void setCRAppBoardDAO(MypageTroupeCrAppDAO MypageTroupeCrAppDAO) {
		this.MypageTroupeCrAppDAO = MypageTroupeCrAppDAO;
	}

	@Override
	public List<MypageTroupeCrAppListVO> getBoardList() throws Exception {
		List<MypageTroupeCrAppListVO> CRAppList = MypageTroupeCrAppDAO.selectCRAppList();
		
		return CRAppList;
	}

	@Override
	public MypageTroupeCrAppListVO readBoard(String cr_app_code) throws SQLException {
		MypageTroupeCrAppListVO CRApp = MypageTroupeCrAppDAO.selectCRApp(cr_app_code);
		
		return CRApp;
	}

	@Override
	public MypageTroupeCrAppListVO getBoardForModify(String cr_app_code) throws SQLException {
		MypageTroupeCrAppListVO CRApp = MypageTroupeCrAppDAO.selectCRApp(cr_app_code);

		return CRApp;
	}

	@Override
	public void write(MypageTroupeCrAppListVO CRAppboard) throws SQLException {
		int num = MypageTroupeCrAppDAO.selectCRAppNextSeq();

		String code = "APP" + String.format("%04d", num);
		CRAppboard.setCr_app_num(num);
		CRAppboard.setCr_app_code(code);

		MypageTroupeCrAppDAO.insertCRApp(CRAppboard);
	}

	@Override
	public void modify(MypageTroupeCrAppListVO CRAppboard) throws SQLException {
		MypageTroupeCrAppDAO.updateCRApp(CRAppboard);
	}

	@Override
	public void remove(String cr_app_code) throws SQLException {
		MypageTroupeCrAppDAO.deleteCRApp(cr_app_code);
	}
}
