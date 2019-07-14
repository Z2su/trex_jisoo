package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.AdVO;

public interface AdService {
	
	public List<AdVO> adList() throws SQLException;
	public AdVO adDetail(int ad_num) throws SQLException;
	
	void write(AdVO ad)throws SQLException;
	void modify(AdVO ad)throws SQLException;
	void remove(int ad_num) throws SQLException;

}
