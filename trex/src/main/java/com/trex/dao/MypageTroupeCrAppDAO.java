package com.trex.dao;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageTroupeCrAppListVO;

public interface MypageTroupeCrAppDAO {

	public void insertTroupeCrApp(MypageTroupeCrAppListVO cr_app)throws Exception;
	public MypageTroupeCrAppListVO selectTroureBycr_app_num(int cr_app_num)throws Exception;
	public void updateTroupeCrApp(MypageTroupeCrAppListVO cr_app)throws Exception;
	public void deleteTroupeCrApp(int cr_app_num)throws Exception;
			
	List<MypageTroupeCrAppListVO> selectSearchTroupeCrAppList(SearchCriteria cri) throws Exception;
}
