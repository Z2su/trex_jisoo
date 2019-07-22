package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageTroupeCrAppListVO;

public interface MypageTroupeCrAppService {

	public void create(MypageTroupeCrAppListVO cr_app) throws Exception;

	public MypageTroupeCrAppListVO read(int cr_app_num) throws Exception;

	public MypageTroupeCrAppListVO readByNum(int cr_app_num) throws Exception;

	public void modify(MypageTroupeCrAppListVO cr_app) throws Exception;

	public void remove(int cr_app_num) throws Exception;

	public List<MypageTroupeCrAppListVO> listSearch(SearchCriteria cri) throws Exception;
}
