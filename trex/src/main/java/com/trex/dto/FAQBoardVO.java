package com.trex.dto;

import java.util.Date;

public class FAQBoardVO {
	
	private String FAQ_code;
	private int FAQ_num;
	private String title;
	private String writer;
	private String cont;
	private Date regdate;
	private Date modidate;
	private int viewcnt;
	public String getFAQ_code() {
		return FAQ_code;
	}
	public void setFAQ_code(String fAQ_code) {
		FAQ_code = fAQ_code;
	}
	public int getFAQ_num() {
		return FAQ_num;
	}
	public void setFAQ_num(int fAQ_num) {
		FAQ_num = fAQ_num;
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
	@Override
	public String toString() {
		return "FAQBoardVO [FAQ_code=" + FAQ_code + ", FAQ_num=" + FAQ_num + ", title=" + title + ", writer=" + writer
				+ ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", viewcnt=" + viewcnt + "]";
	}
	
	
	
	

}
