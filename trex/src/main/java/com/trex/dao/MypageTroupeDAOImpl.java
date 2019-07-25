package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.MypageTroupeVO;

public class MypageTroupeDAOImpl implements MypageTroupeDAO {

	@Autowired
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MypageTroupeVO> selectTroupeList() throws SQLException {
		List<MypageTroupeVO> troupeList = session.selectList("MypageTroupe-Mapper.selectTroupeList", null);

		return troupeList;
	}

	@Override
	public void updateTroupe(MypageTroupeVO troupe_code) throws SQLException {
		session.update("MypageTroupe-Mapper.updateTroupe", troupe_code);
	}

	@Override
	public void deleteTroupe(String troupe_code) throws SQLException {
		session.update("MypageTroupe-Mapper.deleteTroupe", troupe_code);
	}

	@Override
	public MypageTroupeVO selectTroupeByName(String troupe_code) throws SQLException {
		MypageTroupeVO troupe = session.selectOne("MypageTroupe-Mapper.selectTroupeByName", troupe_code);
		return troupe;
	}
}
