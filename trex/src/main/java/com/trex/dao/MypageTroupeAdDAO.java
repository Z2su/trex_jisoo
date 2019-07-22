package com.trex.dao;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageTroupeAdListVO;

public interface MypageTroupeAdDAO {
	
	public void insertTroupeAd(MypageTroupeAdListVO ad) throws Exception;

	public MypageTroupeAdListVO selectTroupeAdByNum(int ad_num) throws Exception;

	void increaseViewcnt(int ad_num) throws Exception;

	List<MypageTroupeAdListVO> selectSearchTroupeAdList(SearchCriteria cri) throws Exception;

	int selectSearchTroupeAdCount(SearchCriteria cri) throws Exception;
}
