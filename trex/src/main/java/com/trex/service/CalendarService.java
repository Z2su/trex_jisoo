package com.trex.service;

import java.util.List;

import com.trex.dto.CalendarVO;


public interface CalendarService {

	List<CalendarVO> calenderlist() throws Exception;
	
	void create(CalendarVO calendr) throws Exception;

	void remove(String code) throws Exception;


}
