package com.trex.dao;

import java.sql.SQLException;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.MypageTroupeAdListVO;

import com.trex.request.Criteria;

public class MypageTroupeAdDAOImpl implements MypageTroupeAdDAO {

	@Autowired
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MypageTroupeAdListVO> selectAdList() throws SQLException {
		List<MypageTroupeAdListVO> adList = session.selectList("MypageTroupeAd-Mapper.selectAdList", null);

		return adList;
	}

	@Override
	public MypageTroupeAdListVO selectAdByad_num(int ad_num) throws SQLException {
		MypageTroupeAdListVO ad = session.selectOne("MypageTroupeAd-Mapper.selectAdByad_num", ad_num);
		
		return ad;
	}

	@Override
	public void insertAd(MypageTroupeAdListVO ad) throws SQLException {
		session.update("MypageTroupeAd-Mapper.insertAd", ad);
	}

	@Override
	public void updateAd(MypageTroupeAdListVO ad) throws SQLException {
		session.update("MypageTroupeAd-Mapper.updateAd", ad);

	}

	@Override
	public void deleteAd(int ad_num) throws SQLException {
		session.update("MypageTroupeAd-Mapper.deleteAd", ad_num);
	}

	@Override
	public void increaseViewCnt(int ad_num) throws SQLException {
		session.update("MypageTroupeAd-Mapper.increaseViewCnt", ad_num);
	}

	@Override
	public int selectAdSeqNext() throws SQLException {
		int ad_num = session.selectOne("MypageTroupeAd-Mapper.selectAdSeqNext");
		
		return ad_num;
	}

	@Override
	public List<MypageTroupeAdListVO> selectSearchAdList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MypageTroupeAdListVO> adList = session.selectList("MypageTroupeAd-Mapper.selectSearchAdList", cri, rowBounds);

		return adList;
	}

	@Override
	public int selectSearchAdListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("MypageTroupeAd-Mapper.selectSearchAdListCount", cri);
		
		return count;
	}

	@Override
	public List<MypageTroupeAdListVO> selectPointAdList(Criteria cri) throws SQLException {
		List<MypageTroupeAdListVO> adList = session.selectList("MypageTroupeAd-Mapper.selectPointAdList", cri);
		
		return adList;
	}
}