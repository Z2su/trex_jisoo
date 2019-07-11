package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dao.CoronationDAO;
import com.trex.dao.PerformGuidBoardDAO;
import com.trex.dto.CoronationVO;

public class CoronationServiceImpl implements CoronationService {
	

	private CoronationDAO CoronationDAO;
	public void setCRGBoardDAO(CoronationDAO CoronationDAO) {
		this.CoronationDAO = CoronationDAO;
	}

	@Override
	public List<CoronationVO> getBoardList() throws Exception {
		List<CoronationVO> CRGBoardList = CoronationDAO.selectCRGBoardList();
		return CRGBoardList;
	}

	@Override
	public CoronationVO readBoard(String crg_code) throws SQLException {
		CoronationVO CRGBoard = CoronationDAO.selectCRGBoard(crg_code);
		CoronationDAO.increaseViewCnt(crg_code);
		return CRGBoard;
	}

	@Override
	public CoronationVO getBoardForModify(String crg_code) throws SQLException {
		CoronationVO CRGBoard = CoronationDAO.selectCRGBoard(crg_code);
		
		return CRGBoard;
	}

	@Override
	public void write(CoronationVO CRGBoard) throws SQLException {
		int crg_num=CoronationDAO.selectCRGBoardNextSeq();
		
		CRGBoard.setCrg_num(crg_num);
		
		CoronationDAO.insertCRGBoard(CRGBoard);

	}

	@Override
	public void modify(CoronationVO CRGBoard) throws SQLException {
		CoronationDAO.updateCRGBoard(CRGBoard);

	}

	@Override
	public void remove(String crg_code) throws SQLException {
		CoronationDAO.deleteCRGBoard(crg_code);

	}


}
