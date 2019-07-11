package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.EventDAO;
import com.trex.dto.EventVO;

public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;
	public void setEventDAO(EventDAO eventDAO) {
		this.eventDAO = eventDAO;
	}
	@Override
	public List<EventVO> eventList() throws SQLException {
		List<EventVO> eventList = eventDAO.selectEventList();
		
		return eventList;
	}

	@Override
	public EventVO eventDetail(int event_num) throws SQLException {
		EventVO event = eventDAO.selectEventByevent_num(event_num);
		
		return event;
	}

}
