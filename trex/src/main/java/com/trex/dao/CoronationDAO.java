package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CoronationVO;

public interface CoronationDAO {
	
	List<CoronationVO> selectCRGBoardList() throws SQLException;
	CoronationVO selectCRGBoard(String crg_code) throws SQLException;
	
	void insertCRGBoard(CoronationVO CRGBoard) throws SQLException;
	void updateCRGBoard(CoronationVO CRGBoard) throws SQLException;
	void deleteCRGBoard(String crg_code) throws SQLException;
	
	void increaseViewCnt(String crg_code) throws SQLException;
	
	int selectCRGBoardNextSeq() throws SQLException;

}
