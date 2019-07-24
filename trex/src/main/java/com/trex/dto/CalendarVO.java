package com.trex.dto;

import java.sql.Date;



public class CalendarVO {
	
	private String code;
 private String title;
 private Date starttime;
 private Date endtime;
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Date getStarttime() {
	return starttime;
}
public void setStarttime(Date starttime) {
	this.starttime = starttime;
}
public Date getEndtime() {
	return endtime;
}
public void setEndtime(Date endtime) {
	this.endtime = endtime;
}
@Override
public String toString() {
	return "CalendarVO [code=" + code + ", title=" + title + ", starttime=" + starttime + ", endtime=" + endtime + "]";
}
 
 

}
