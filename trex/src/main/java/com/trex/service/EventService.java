package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.EventVO;

public interface EventService {

	public List<EventVO> eventList() throws SQLException;
	public EventVO eventDetail(int event_num) throws SQLException;
	
}
