package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.AdVO;

public interface AdDAO {
	
	public List<AdVO> selectAdList() throws SQLException;
	
	
	AdVO selectAdByad_num(int ad_num) throws SQLException;
	void insertAd(AdVO ad)throws SQLException;
	void updateAd(AdVO ad)throws SQLException;
	void deleteAd(int ad_num)throws SQLException;
	
	void increaseViewCnt(int ad_num)throws SQLException;
	
	int selectAdSeqNext() throws SQLException;
	
	

}
