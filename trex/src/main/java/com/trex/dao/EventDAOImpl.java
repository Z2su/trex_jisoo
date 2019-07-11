package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.EventVO;

public class EventDAOImpl implements EventDAO{

	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<EventVO> selectEventList() throws SQLException {
		List<EventVO> eventList = session.selectList("Event-Mapper.selectEventList",null);
		return eventList;
	}

	@Override
	public EventVO selectEventByevent_num(int event_num) throws SQLException {
		EventVO event = session.selectOne("Event-Mapper.selectEventByevent_num",event_num);
		return event;
	}

}
