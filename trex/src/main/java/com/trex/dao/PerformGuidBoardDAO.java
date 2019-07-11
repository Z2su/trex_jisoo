package com.trex.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.trex.dto.PerformGuidBoardVO;
import com.trex.dto.PerformScheduleVO;
import com.trex.dto.PerformVO;

public interface PerformGuidBoardDAO {
	
	List<PerformGuidBoardVO> selectPFGBoardList() throws SQLException;
	PerformGuidBoardVO selectPFGBoard(String pfg_code) throws SQLException;
	
	void insertPFGBoard(PerformGuidBoardVO PFGBoard) throws SQLException;
	void updatePFGBoard(PerformGuidBoardVO PFGBoard) throws SQLException;
	void deletePFGBoard(String pfg_code) throws SQLException;
	
	void increaseViewCnt(String pfg_code) throws SQLException;
	
	int selectPFGBoardNextSeq() throws SQLException;
	
	List<PerformGuidBoardVO> selectPFGBoardListByPFcode(String pf_code) throws SQLException;
	PerformGuidBoardVO selectPFGBoardByPFSH(String pfsh_code) throws SQLException;
	
	
	/*PerformVO selectPF(String pf_code) throws SQLException;
	PerformScheduleVO selectPFSH(String pf_code) throws SQLException;*/
}
