package com.trex.dto;

import java.sql.Date;

public class PfAppVO {
	
	private String pf_app_code;
	private int pf_app_num;
	private String writer;
	private String title;
	private String cont;
	private Date regdate;
	private Date startdate;
	private Date enddate;
	
	public String getPf_app_code() {
		return pf_app_code;
	}
	public void setPf_app_code(String pf_app_code) {
		this.pf_app_code = pf_app_code;
	}
	public int getPf_app_num() {
		return pf_app_num;
	}
	public void setPf_app_num(int pf_app_num) {
		this.pf_app_num = pf_app_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "PfAppVO [pf_app_code=" + pf_app_code + ", pf_app_num=" + pf_app_num + ", writer=" + writer + ", title="
				+ title + ", cont=" + cont + ", regdate=" + regdate + ", startdate=" + startdate + ", enddate="
				+ enddate + "]";
	}
	
	

}
