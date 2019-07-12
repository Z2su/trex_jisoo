package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PrVO;

public interface PrService {
	
	public List<PrVO> prList() throws SQLException;
	public PrVO prDetail(int pr_num) throws SQLException;
	
	void write(PrVO pr) throws SQLException;
	void modify(PrVO pr) throws SQLException;
	void remove(int pr_num) throws SQLException;

}
