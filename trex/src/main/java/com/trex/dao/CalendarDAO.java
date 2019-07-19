package com.trex.dao;

import java.util.List;
import java.util.Map;

import com.trex.dto.CalendarVO;

public interface CalendarDAO {

	
	
	Map<String, Object> getMapList() throws Exception;
	List<CalendarVO> getList() throws Exception;
	void insert(CalendarVO calendar) throws Exception;
	void delete(String code) throws Exception;
	
}
