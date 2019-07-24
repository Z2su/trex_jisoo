package com.trex.controller;

import java.util.Date;

import com.trex.dto.CalendarVO;

public class CalendarData {
	private String title;
	private Date start;
	private Date end;
	private String url;
	private String  backgroundColor;
	private String  borderColor;
	
	
	
	public CalendarData() {}
	public CalendarData(CalendarVO calendar) {
		super();
		this.title = calendar.getTitle();
		this.start = calendar.getStarttime();
		this.end = calendar.getEndtime();
		this.url = "caldetail?code="+calendar.getCode();
		
		String dict= calendar.getCode().substring(0,4);
		switch(dict) {
		case"PFSH"://공연 
			backgroundColor="#00c0ef";//aqua
			borderColor="#00c0ef";
			break;
		case"CRSH"://대관
			backgroundColor="'#00a65a"; //green
			borderColor="'#00a65a";
			break;
		default:
			backgroundColor="#f56954"; //red
			borderColor="#f56954"; //red
			;
		}
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
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	
}
