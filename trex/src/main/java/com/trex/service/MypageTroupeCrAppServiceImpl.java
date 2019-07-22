package com.trex.service;

import java.util.List;

import com.trex.controller.SearchCriteria;
import com.trex.dao.MypageTroupeCrAppDAO;
import com.trex.dto.MypageTroupeCrAppListVO;

public class MypageTroupeCrAppServiceImpl implements MypageTroupeCrAppService {

	private MypageTroupeCrAppDAO mypagetroupecrappDAO;

	public void setMypageMemberboardDAO(MypageTroupeCrAppDAO mypagetroupecrappDAO) {
		this.mypagetroupecrappDAO = mypagetroupecrappDAO;
	}
	
	@Override
	public void create(MypageTroupeCrAppListVO cr_app) throws Exception {
		mypagetroupecrappDAO.insertTroupeCrApp(cr_app);
	}


	@Override
	public MypageTroupeCrAppListVO read(int cr_app_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MypageTroupeCrAppListVO readByNum(int cr_app_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(MypageTroupeCrAppListVO cr_app) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int cr_app_num) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MypageTroupeCrAppListVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
