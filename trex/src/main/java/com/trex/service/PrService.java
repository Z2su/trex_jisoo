package com.trex.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.trex.dto.PrVO;
import com.trex.request.Criteria;

public interface PrService {
	
	public Map<String,Object> getPrList(Criteria cri)throws SQLException;
	
	public PrVO prDetail(int pr_num) throws SQLException;
	
	void write(PrVO pr) throws SQLException;
	void modify(PrVO pr) throws SQLException;
	void remove(int pr_num) throws SQLException;

}
