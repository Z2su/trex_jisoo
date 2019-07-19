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
		eventDAO.enableList();
		
		return eventList;
	}
	@Override
	public List<EventVO> eventEndList() throws SQLException {
		List<EventVO> eventEndList = eventDAO.selectEventEndList();
		return eventEndList;
	}

	@Override
	public EventVO eventDetail(int event_num) throws SQLException {
		EventVO event = eventDAO.selectEventByevent_num(event_num);
		
		return event;
	}
	@Override
	public void write(EventVO event) throws SQLException {
		/*int event_num = eventDAO.selectEventSeqNext();
		String code = "EVE"+ String.format("%04d", event_num);*/
		
		
		eventDAO.insertEvent(event);
	}
	@Override
	public void modify(EventVO event) throws SQLException {
		eventDAO.updateEvent(event);
	}
	@Override
	public void remove(int event_num) throws SQLException {
		eventDAO.deleteEvent(event_num);
	}

}
