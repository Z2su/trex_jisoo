package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PerformVO;

public interface PerformDAO {
	
	public List<PerformVO> selectPFList() throws SQLException;
	public PerformVO selectPF(String pf_code) throws SQLException;
	
	
}
