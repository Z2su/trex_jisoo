package com.trex.dto;

import java.util.Date;

public class PerformGuidBoardVO1 {
	private String pfg_code;
	private int pfg_num;
	private String title;
	private String writer;
	private String cont;
	private Date regdate;
	private Date modidate;
	private int viewcnt;
	private String pf_code;
	
	public PerformGuidBoardVO1() {
		
	}
	
	public PerformGuidBoardVO1(String pfg_code, int pfg_num, String title, String writer, String cont, String pf_code) {
		super();
		this.pfg_code = pfg_code;
		this.pfg_num = pfg_num;
		this.title = title;
		this.writer = writer;
		this.cont = cont;
		this.pf_code = pf_code;
	}

	public String getPfg_code() {
		return pfg_code;
	}
	public void setPfg_code(String pfg_code) {
		this.pfg_code = pfg_code;
	}
	public int getPfg_num() {
		return pfg_num;
	}
	public void setPfg_num(int pfg_num) {
		this.pfg_num = pfg_num;
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getPf_code() {
		return pf_code;
	}
	public void setPf_code(String pf_code) {
		this.pf_code = pf_code;
	}
	@Override
	public String toString() {
		return "PerformBoardVO [pfg_code=" + pfg_code + ", pfg_num=" + pfg_num + ", title=" + title + ", writer="
				+ writer + ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", viewcnt=" + viewcnt
				+ ", pf_code=" + pf_code + "]";
	}
	
}
