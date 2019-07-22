package com.trex.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageTroupeAdListVO;

public class MypageTroupeAdDAOImpl implements MypageTroupeAdDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private static final String NAMESPACE = "MypageTroupeAd-Mapper";

	@Override
	public void insertTroupeAd(MypageTroupeAdListVO ad) throws Exception {
		session.update(NAMESPACE + ".insertTroupeAd", ad);
	}

	@Override
	public MypageTroupeAdListVO selectTroupeAdByNum(int ad_num) throws Exception {
		MypageTroupeAdListVO ad = (MypageTroupeAdListVO) session.selectOne(NAMESPACE + ".selectTroupeAdByNum", ad_num);
		return ad;
	}
	
	@Override
	public void increaseViewcnt(int ad_num) throws Exception {
		session.update(NAMESPACE + ".increaseViewCnt", ad_num);
	}

	@Override
	public List<MypageTroupeAdListVO> selectSearchTroupeAdList(SearchCriteria cri) throws Exception {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<MypageTroupeAdListVO> adList = session.selectList(NAMESPACE + ".selectSearchTroupeAdList", cri,
				rowBounds);
		return adList;
	}

	@Override
	public int selectSearchTroupeAdCount(SearchCriteria cri) throws Exception {
		int rowCount = session.selectOne(NAMESPACE + ".selectSearchTroupeAdCount", cri);
		return rowCount;
	}

}
