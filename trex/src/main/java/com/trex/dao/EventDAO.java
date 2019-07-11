package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.EventVO;
import com.trex.request.Criteria;

public interface EventDAO {

	public List<EventVO> selectEventList() throws SQLException;
	EventVO selectEventByevent_num(int event_num) throws SQLException;
	
	void insertEvent(EventVO event) throws SQLException;
	void updateEvent(EventVO event) throws SQLException;
	void deleteEvent(int event_num) throws SQLException;
	
	void increaseViewCnt(int event_num) throws SQLException;
	
	int selectEventSeqNext() throws SQLException;
	
}
