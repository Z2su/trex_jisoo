package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.EventVO;
import com.trex.request.Criteria;

public class EventDAOImpl implements EventDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<EventVO> selectEventList(Criteria cri) throws SQLException {
		List<EventVO> eventList = 
				session.selectList("Event-Mapper.selectEventList",null);
		return eventList;
	}

	@Override
	public EventVO selectEventByevent_num(int event_num) throws SQLException {
		EventVO event = 
				session.selectOne("Event-Mapper.selectEventByEvent_num",event_num);
		return event;
	}

	@Override
	public void insertEvent(EventVO event) throws SQLException {
		session.update("Event-Mapper.insertEvent",event);
	}

	@Override
	public void updateEvent(EventVO event) throws SQLException {
		session.update("Event-Mapper.updateEvent", event);
	}

	@Override
	public void deleteEvent(int event_num) throws SQLException {
		session.update("Event-Mapper.deleteEvent",event_num);
		}

	@Override
	public void increaseViewCnt(int event_num) throws SQLException {
		session.update("Event-Mapper.increaseViewCnt",event_num);
	}

	@Override
	public int selectEventSeqNext() throws SQLException {
		int seq_num = 
				session.selectOne("Event-Mapper.seslctEventSeqNext");
		return seq_num;
	}

}
