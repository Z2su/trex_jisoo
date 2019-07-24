package com.trex.dto;

import java.sql.Date;

public class CrAppVO {
	
	private String cr_app_code;
	private int cr_app_num;
	private String hall_code;
	private String ep_code;
	private String writer;
	private String title;
	private int enable;
	private String cont;
	private Date regdate;
	private Date modidate;
	private String pf_code;
	private Date startdate;
	private Date enddate;
	
	public String getCr_app_code() {
		return cr_app_code;
	}
	public void setCr_app_code(String cr_app_code) {
		this.cr_app_code = cr_app_code;
	}
	public int getCr_app_num() {
		return cr_app_num;
	}
	public void setCr_app_num(int cr_app_num) {
		this.cr_app_num = cr_app_num;
	}
	public String getHall_code() {
		return hall_code;
	}
	public void setHall_code(String hall_code) {
		this.hall_code = hall_code;
	}
	public String getEp_code() {
		return ep_code;
	}
	public void setEp_code(String ep_code) {
		this.ep_code = ep_code;
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
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
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
	public Date getModidate() {
		return modidate;
	}
	public void setModidate(Date modidate) {
		this.modidate = modidate;
	}
	public String getPf_code() {
		return pf_code;
	}
	public void setPf_code(String pf_code) {
		this.pf_code = pf_code;
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
		return "CrAppVO [cr_app_code=" + cr_app_code + ", cr_app_num=" + cr_app_num + ", hall_code=" + hall_code
				+ ", ep_code=" + ep_code + ", writer=" + writer + ", title=" + title + ", enable=" + enable + ", cont="
				+ cont + ", regdate=" + regdate + ", modidate=" + modidate + ", pf_code=" + pf_code + ", startdate="
				+ startdate + ", enddate=" + enddate + "]";
	}
	
	
	
	
}
