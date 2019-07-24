package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.AdVO;
import com.trex.request.Criteria;

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

	@Override
	public List<AdVO> selectSearchAdList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit= cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<AdVO> adList = session.selectList("Ad-Mapper.selectSearchAdList",cri,rowBounds);
		
		return adList;
		
	}

	@Override
	public int selectSearchAdListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Ad-Mapper.selectSearchAdListCount",cri);
		return count;
	}

	@Override
	public List<AdVO> selectPointAdList(Criteria cri) throws SQLException {
		List<AdVO> adList = session.selectList("Ad-Mapper.selectPointAdList",cri);		
		return adList;
	}

	@Override
	public List<AdVO> selectAdBannerList() throws SQLException {
		List<AdVO> adList = session.selectList("Ad-Mapper.selectAdListBanner");	
		return adList;
	}

	@Override
	public void updateAgree1(AdVO ad) throws SQLException {
		
		session.update("Ad-Mapper.updateAgree1",ad);
	}
	@Override
	public void updateAgree2(AdVO ad) throws SQLException {
		
		session.update("Ad-Mapper.updateAgree2",ad);
	}

	@Override
	public AdVO selectAdBypf_code(String writer) throws SQLException {
		AdVO ad = session.selectOne("Ad-Mapper.selectAdBypf_code",writer);	
		return ad;
	}

}
