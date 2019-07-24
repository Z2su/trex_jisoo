package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.AdVO;
import com.trex.dto.PrVO;
import com.trex.request.Criteria;

public interface PrDAO {
	
	public List<PrVO> selectSearchPrList(Criteria cri) throws SQLException;
	public int selectSearchPrListCount(Criteria cri) throws SQLException;
	public List<PrVO> selectPointPrList(Criteria cri)throws SQLException;
	
	public List<PrVO> selectPrList() throws SQLException;
	
	
	PrVO selectPrBypr_num(int pr_num) throws SQLException;
	void insertPr(PrVO pr)throws SQLException;
	void updatePr(PrVO pr)throws SQLException;
	
	void deletePr(int pr_num)throws SQLException;
	
	void increaseViewCnt(int pr_num) throws SQLException;
	
	
	int selectPrSeqNext() throws SQLException;
	
	
	
	
	
	
	
	

}
