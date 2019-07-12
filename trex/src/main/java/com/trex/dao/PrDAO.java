package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PrVO;

public interface PrDAO {
	
	public List<PrVO> selectPrList() throws SQLException;
	
	PrVO selectPrBypr_num(int pr_num) throws SQLException;
	void insertPr(PrVO pr)throws SQLException;
	void updatePr(PrVO pr)throws SQLException;
	void deletePr(int pr_num)throws SQLException;
	
	void increaseViewCnt(int pr_num) throws SQLException;
	
	
	int selectPrSeqNext() throws SQLException;
	
	
	
	
	
	
	
	

}
