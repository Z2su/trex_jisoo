package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dao.MypageTroupeAdDAO;
import com.trex.dto.MypageTroupeAdListVO;

public class MypageTroupeAdServiceImpl implements MypageTroupeAdService {

	private MypageTroupeAdDAO mypagetroupeadDAO;
	public void setMypagetroupeadDAO(MypageTroupeAdDAO mypagetroupeadDAO) {
		this.mypagetroupeadDAO = mypagetroupeadDAO;
	}
	
	@Override
	public void create(MypageTroupeAdListVO ad) throws Exception {
		mypagetroupeadDAO.insertTroupeAd(ad);
	}

	@Override
	public MypageTroupeAdListVO read(int ad_num) throws Exception {
		MypageTroupeAdListVO Troupead = mypagetroupeadDAO.selectTroupeAdByNum(ad_num);
		mypagetroupeadDAO.increaseViewcnt(ad_num);
		return Troupead;
	}

	@Override
	public MypageTroupeAdListVO readByNum(int ad_num) throws Exception {
		MypageTroupeAdListVO Troupead = mypagetroupeadDAO.selectTroupeAdByNum(ad_num);
		return Troupead;
	}

	@Override
	public List<MypageTroupeAdListVO> listSearch(SearchCriteria cri) throws Exception {
		List<MypageTroupeAdListVO> adlist = mypagetroupeadDAO.selectSearchTroupeAdList(cri);
		return adlist;
	}

	@Override
	public int readSearchTroupeAdCount(SearchCriteria cri) throws Exception {
		int count = mypagetroupeadDAO.selectSearchTroupeAdCount(cri);
		return count;
	}

}
