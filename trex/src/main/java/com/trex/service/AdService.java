package com.trex.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.trex.dto.AdVO;
import com.trex.request.Criteria;

public interface AdService {
	
	public Map<String,Object> getAdList(Criteria cri)throws SQLException;
	
	public AdVO adDetail(int ad_num) throws SQLException;
	
	void write(AdVO ad)throws SQLException;
	void modify(AdVO ad)throws SQLException;
	void remove(int ad_num) throws SQLException;

}
