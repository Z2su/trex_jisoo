package com.trex.dto;

import java.sql.Date;

public class CrshVO {
	
	private String crsh_code;
	private int crsh_num;
	private Date startdate;
	private Date enddate;
	private String hall_code;
	private String cr_app_code;
	
	public String getCrsh_code() {
		return crsh_code;
	}
	public void setCrsh_code(String crsh_code) {
		this.crsh_code = crsh_code;
	}
	public int getCrsh_num() {
		return crsh_num;
	}
	public void setCrsh_num(int crsh_num) {
		this.crsh_num = crsh_num;
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
	public String getHall_code() {
		return hall_code;
	}
	public void setHall_code(String hall_code) {
		this.hall_code = hall_code;
	}
	public String getCr_app_code() {
		return cr_app_code;
	}
	public void setCr_app_code(String cr_app_code) {
		this.cr_app_code = cr_app_code;
	}
	@Override
	public String toString() {
		return "CrshVO [crsh_code=" + crsh_code + ", crsh_num=" + crsh_num + ", startdate=" + startdate + ", enddate="
				+ enddate + ", hall_code=" + hall_code + ", cr_app_code=" + cr_app_code + "]";
	}
	
	

}
