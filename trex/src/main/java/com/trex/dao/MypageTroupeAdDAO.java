package com.trex.dao;

import java.sql.SQLException;

import java.util.List;

import com.trex.dto.MypageTroupeAdListVO;

import com.trex.request.Criteria;

public interface MypageTroupeAdDAO {
	
	public List<MypageTroupeAdListVO>selectSearchAdList(Criteria cri) throws SQLException;
	public int selectSearchAdListCount(Criteria cri) throws SQLException;
	public List<MypageTroupeAdListVO> selectPointAdList(Criteria cri)throws SQLException;
	
	public List<MypageTroupeAdListVO> selectAdList() throws SQLException;

	MypageTroupeAdListVO selectAdByad_num(int ad_num) throws SQLException;
	
	void insertAd(MypageTroupeAdListVO ad)throws SQLException;
	void updateAd(MypageTroupeAdListVO ad)throws SQLException;
	void deleteAd(int ad_num)throws SQLException;
	
	void increaseViewCnt(int ad_num)throws SQLException;
	
	int selectAdSeqNext() throws SQLException;
}