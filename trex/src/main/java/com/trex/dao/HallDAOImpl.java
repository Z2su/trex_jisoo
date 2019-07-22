package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.HallVO;

public class HallDAOImpl implements HallDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<HallVO> selectHallList() throws SQLException {
		List<HallVO> HallList = session.selectList("Hall-Mapper.selectHallList",null);
		
		return HallList;
	}

	@Override
	public HallVO selectHall(String hall_code) throws SQLException {
		HallVO Hall = session.selectOne("Hall-Mapper.selectHall",hall_code);
		return Hall;
	}

	@Override
	public void insertHall(HallVO hall) throws SQLException {
		session.update("Hall-Mapper.insertHall",hall);

	}

	@Override
	public void updateHall(HallVO hall) throws SQLException {
		session.update("Hall-Mapper.updateHall",hall);

	}

	@Override
	public void deleteHall(String hall_code) throws SQLException {
		session.update("Hall-Mapper.deleteHall",hall_code);

	}

	@Override
	public int selectHallNextSeq() throws SQLException {
		int seq_num = session.selectOne("Hall-Mapper.selectHallNextSeq");
		return seq_num;
	}

}
