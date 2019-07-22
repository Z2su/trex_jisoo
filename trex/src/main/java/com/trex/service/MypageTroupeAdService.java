package com.trex.service;

import java.sql.SQLException;

import java.util.Map;

import com.trex.dto.MypageTroupeAdListVO;

import com.trex.request.Criteria;

public interface MypageTroupeAdService {

	public Map<String,Object> getAdList(Criteria cri)throws SQLException;
	
	public MypageTroupeAdListVO adDetail(int ad_num) throws SQLException;
	
	void write(MypageTroupeAdListVO ad)throws SQLException;
	void modify(MypageTroupeAdListVO ad)throws SQLException;
	void remove(int ad_num) throws SQLException;
}
