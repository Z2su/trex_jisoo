package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageTroupeAdListVO;

public interface MypageTroupeAdService {

	public void create(MypageTroupeAdListVO ad) throws Exception;

	public MypageTroupeAdListVO read(int ad_num) throws Exception;

	public MypageTroupeAdListVO readByNum(int ad_num) throws Exception;


	public List<MypageTroupeAdListVO> listSearch(SearchCriteria cri) throws Exception;

	int readSearchTroupeAdCount(SearchCriteria cri) throws Exception;
}
