package com.trex.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.AdDAO;
import com.trex.dto.AdVO;
import com.trex.request.Criteria;
import com.trex.request.PageMaker;

public class AdServiceImpl implements AdService {

	@Autowired
	private AdDAO adDAO;

	public void setAdDAO(AdDAO adDAO) {
		this.adDAO = adDAO;
	}

	/*
	 * @Override public List<AdVO> adList() throws SQLException { List<AdVO> adList
	 * = adDAO.selectAdList(); return adList; }
	 */

	@Override
	public AdVO adDetail(int ad_num) throws SQLException {
		AdVO ad = adDAO.selectAdByad_num(ad_num);
		return ad;
	}

	@Override
	public void write(AdVO ad) throws SQLException {
		int ad_num = adDAO.selectAdSeqNext();
		String code = "ADV" + String.format("%04d", ad_num);
		ad.setAd_code(code);
		ad.setAd_num(ad_num);
		adDAO.insertAd(ad);

	}

	@Override
	public void modify(AdVO ad) throws SQLException {
		adDAO.updateAd(ad);
	}

	@Override
	public void remove(int ad_num) throws SQLException {
		adDAO.deleteAd(ad_num);
	}

	@Override
	public Map<String, Object> getAdList(Criteria cri) throws SQLException {
		List<AdVO> adList = adDAO.selectSearchAdList(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adDAO.selectSearchAdListCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("adList", adList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

}
