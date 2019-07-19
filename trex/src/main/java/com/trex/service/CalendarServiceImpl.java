package com.trex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.CalendarDAO;
import com.trex.dto.CalendarVO;

public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDAO calenderDAO;
	public void setCalenderDAO(CalendarDAO calenderDAO) {
		this.calenderDAO = calenderDAO;
	}
	
	@Override
	public List<CalendarVO> calenderlist() throws Exception {
		List<CalendarVO> list = calenderDAO.getList();
		return list;
	}

	@Override
	public void create(CalendarVO calendar) throws Exception {
		calenderDAO.insert(calendar);

	}

	@Override
	public void remove(String code) throws Exception {
		calenderDAO.delete(code);
	}

}
