package com.trex.dto;

import java.util.Date;

public class FAQBoardVO {
	
	private String faq_code;
	private int faq_num;
	private String title;
	private String writer;
	private String cont;
	private Date regdate;
	private Date modidate;
	private int viewcnt;
	
	
	public String getFAQ_code() {
		return faq_code;
	}
	
	
	public int getFAQ_num() {
		return faq_num;
	}

	public void setFAQ_code(String FAQ_code) {
		this.faq_code = FAQ_code;
	}

	public void setFAQ_num(int faq_num) {
		this.faq_num = faq_num;
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
		return "FAQBoardVO [faq_code=" + faq_code + ", faq_num=" + faq_num + ", title=" + title + ", writer=" + writer
				+ ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", viewcnt=" + viewcnt + "]";
	}
	
	
	
	
	

}
