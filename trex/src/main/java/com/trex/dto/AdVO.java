package com.trex.dto;

import java.sql.Date;

public class AdVO {
	
	private String ad_code;
	private int ad_num;
	private String title; 
	private String writer;
	private String cont;
	private Date regist_date;
	private int viewcnt;
	private String ep_code;
	private int app_result;
	public String getAd_code() {
		return ad_code;
	}
	public void setAd_code(String ad_code) {
		this.ad_code = ad_code;
	}
	public int getAd_num() {
		return ad_num;
	}
	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getEp_code() {
		return ep_code;
	}
	public void setEp_code(String ep_code) {
		this.ep_code = ep_code;
	}
	public int getApp_result() {
		return app_result;
	}
	public void setApp_result(int app_result) {
		this.app_result = app_result;
	}
	@Override
	public String toString() {
		return "AdVO [ad_code=" + ad_code + ", ad_num=" + ad_num + ", title=" + title + ", writer=" + writer + ", cont="
				+ cont + ", regist_date=" + regist_date + ", viewcnt=" + viewcnt + ", ep_code=" + ep_code
				+ ", app_result=" + app_result + "]";
	}
	
	
	
	

}
