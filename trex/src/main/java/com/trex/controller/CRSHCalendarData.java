package com.trex.controller;

import java.util.Date;

import com.trex.dto.CalendarVO;
import com.trex.dto.CrshVO;

public class CRSHCalendarData {
	private String title;
	private Date start;
	private Date end;
	private String url;

	
	
	
	public CRSHCalendarData() {}
	public CRSHCalendarData(CrshVO crsh) {
		super();
		this.title = crsh.getCr_app_code();
		this.start = crsh.getStartdate();
		this.end = crsh.getEnddate();
		this.url = crsh.getHall_code();
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
	
	
}
