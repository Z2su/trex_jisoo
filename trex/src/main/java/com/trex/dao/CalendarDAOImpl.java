package com.trex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.CalendarVO;

public class CalendarDAOImpl implements CalendarDAO{

	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	private static final String Map = "Calendar-Mapper";
	
	
	
	@Override
	public void insert(CalendarVO calendar) throws Exception {
		session.update(Map+".insert", calendar);
		
	}
	@Override
	public void delete(String code) throws Exception {
		session.update(Map+".delete",code);
		
	}
	@Override
	public Map<String, Object> getMapList() throws Exception {
		Map<String,Object> list = session.selectMap(Map+".getMapList", null);
		return list;
	}
	@Override
	public List<CalendarVO> getList() throws Exception {
		List<CalendarVO> list = session.selectList(Map+".getList");
		return list;
	}
	
	
	
}
