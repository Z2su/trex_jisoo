package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.AdVO;

public class AdDAOImpl implements AdDAO {
	
	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AdVO> selectAdList() throws SQLException {
		List<AdVO> adList = session.selectList("Ad-Mapper.selectAdList",null);
				
		return adList;
	}

	@Override
	public AdVO selectAdByad_num(int ad_num) throws SQLException {
		AdVO ad = session.selectOne("Ad-Mapper.selectAdByad_num",ad_num);
		return ad;
	}

	@Override
	public void insertAd(AdVO ad) throws SQLException {
		session.update("Ad-Mapper.insertAd",ad);
	}

	@Override
	public void updateAd(AdVO ad) throws SQLException {
		session.update("Ad-Mapper.updateAd",ad);

	}

	@Override
	public void deleteAd(int ad_num) throws SQLException {
		session.update("Ad-Mapper.deleteAd",ad_num);
	}

	@Override
	public void increaseViewCnt(int ad_num) throws SQLException {
		session.update("Ad-Mapper.increaseViewCnt",ad_num);
	}

	@Override
	public int selectAdSeqNext() throws SQLException {
		int ad_num = session.selectOne("Ad-Mapper.selectAdSeqNext");
		return ad_num;
	}

}
