package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dao.PerformGuidBoardDAO;
import com.trex.dto.PerformGuidBoardVO;
import com.trex.dto.PerformGuidBoardVO1;
import com.trex.dto.PerformScheduleVO;
import com.trex.dto.PerformVO;

public class PerformGuidBoardServiceImpl implements PerformGuidBoardService {
	
	private PerformGuidBoardDAO PFGBoardDAO;
	public void setPFGBoardDAO(PerformGuidBoardDAO PFGBoardDAO) {
		this.PFGBoardDAO = PFGBoardDAO;
	}
	@Override
	public List<PerformGuidBoardVO> getBoardList() throws SQLException {
		
		List<PerformGuidBoardVO> PFGBoardList = PFGBoardDAO.selectPFGBoardList();
		return PFGBoardList;
	}

	@Override
	public PerformGuidBoardVO getBoard(String pfg_code) throws SQLException {
		
		PerformGuidBoardVO PFGBoard = PFGBoardDAO.selectPFGBoard(pfg_code);
	
		PFGBoardDAO.increaseViewCnt(pfg_code);
		
		return PFGBoard;
	}

	@Override
	public PerformGuidBoardVO getBoardForModify(String pfg_code) throws SQLException {
		
		PerformGuidBoardVO PFGBoard = PFGBoardDAO.selectPFGBoard(pfg_code);
		
		return PFGBoard;
	
	}

	@Override
	public void write(PerformGuidBoardVO PFGBoard) throws SQLException {
		
		int num = PFGBoardDAO.selectPFGBoardNextSeq();
		
		String code = "PFG"+ String.format("%04d", num);
		PFGBoard.setPfg_code(code);
		PFGBoard.setPfg_num(num);
		
		
		PFGBoardDAO.insertPFGBoard(PFGBoard);

	}

	@Override
	public void modify(PerformGuidBoardVO PFGBaord) throws SQLException {
		
		PFGBoardDAO.updatePFGBoard(PFGBaord);
	}

	@Override
	public void remove(String pfg_code) throws SQLException {
		PFGBoardDAO.deletePFGBoard(pfg_code);

	}
	@Override
	public PerformVO getPF(String pf_code) throws SQLException {
		PerformVO PF = PFGBoardDAO.selectPF(pf_code);
		return PF;
	}
	@Override
	public PerformScheduleVO getPFSH(String pf_code) throws SQLException {

		PerformScheduleVO PFSH = PFGBoardDAO.selectPFSH(pf_code);
		
		return PFSH;
	}

}
