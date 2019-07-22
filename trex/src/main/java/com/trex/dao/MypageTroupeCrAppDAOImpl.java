package com.trex.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.trex.controller.SearchCriteria;
import com.trex.dto.MypageTroupeCrAppListVO;

public class MypageTroupeCrAppDAOImpl implements MypageTroupeCrAppDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private static final String NAMESPACE = "MypageTroureCrAppListMapper";

	@Override
	public void insertTroupeCrApp(MypageTroupeCrAppListVO cr_app) throws Exception {
		session.update(NAMESPACE + ".insertTroureList", cr_app);
	}

	@Override
	public MypageTroupeCrAppListVO selectTroureBycr_app_num(int cr_app_num) throws Exception {
		MypageTroupeCrAppListVO cr_app = (MypageTroupeCrAppListVO) session
				.selectOne(NAMESPACE + ".selectTroureCrAppByNum", cr_app_num);
		return cr_app;
	}

	@Override
	public void updateTroupeCrApp(MypageTroupeCrAppListVO cr_app) throws Exception {
		session.update(NAMESPACE + ".updateTroureCrApp", cr_app);
	}

	@Override
	public void deleteTroupeCrApp(int cr_app_num) throws Exception {
		session.update(NAMESPACE + ".deleteTroureCrApp", cr_app_num);
	}

	@Override
	public List<MypageTroupeCrAppListVO> selectSearchTroupeCrAppList(SearchCriteria cri) throws Exception {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<MypageTroupeCrAppListVO> trourecrappList = session.selectList(NAMESPACE + ".selectSearchTroureCrAppList",
				cri, rowBounds);
		return trourecrappList;
	}
}
