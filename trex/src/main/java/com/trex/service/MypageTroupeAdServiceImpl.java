package com.trex.service;

import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.MypageTroupeAdDAO;

import com.trex.dto.MypageTroupeAdListVO;

import com.trex.request.Criteria;
import com.trex.request.PageMaker;

public class MypageTroupeAdServiceImpl implements MypageTroupeAdService {

	@Autowired
	private MypageTroupeAdDAO mypagetroupeadDAO;

	public void setMypagetroupeadDAO(MypageTroupeAdDAO mypagetroupeadDAO) {
		this.mypagetroupeadDAO = mypagetroupeadDAO;
	}
	
	@Override
	public MypageTroupeAdListVO adDetail(int ad_num) throws SQLException {
		MypageTroupeAdListVO ad = mypagetroupeadDAO.selectAdByad_num(ad_num);
		
		return ad;
	}

	@Override
	public void write(MypageTroupeAdListVO ad) throws SQLException {
		int ad_num = mypagetroupeadDAO.selectAdSeqNext();
		
		String code = "ADV" + String.format("%04d", ad_num);
		
		ad.setAd_code(code);
		ad.setAd_num(ad_num);
		
		mypagetroupeadDAO.insertAd(ad);
	}

	@Override
	public void modify(MypageTroupeAdListVO ad) throws SQLException {
		mypagetroupeadDAO.updateAd(ad);
	}

	@Override
	public void remove(int ad_num) throws SQLException {
		mypagetroupeadDAO.deleteAd(ad_num);
	}

	@Override
	public Map<String, Object> getAdList(Criteria cri) throws SQLException {
		List<MypageTroupeAdListVO> adList = mypagetroupeadDAO.selectSearchAdList(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mypagetroupeadDAO.selectSearchAdListCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("adList", adList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
}