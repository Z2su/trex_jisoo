package com.trex.dto;

import java.sql.Date;

public class PrVO {
	private String pr_code;     //홍보게시판 번호
	private int pr_num;		    // 게시물 번호
	private String title;		// 게시물 제목
	private String writer;		// 글쓴이
	private String cont;		// 내용
	private Date regdate;		// 등록날짜
	private int viewcnt;		// 조회수
	private String ep_code;		// 직원코드
	private int app_result;	    // 승인여부
	
	
	
	public String getPr_code() {
		return pr_code;
	}
	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}
	public int getPr_num() {
		return pr_num;
	}
	public void setPr_num(int pr_num) {
		this.pr_num = pr_num;
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
		return "PrVO [pr_code=" + pr_code + ", pr_num=" + pr_num + ", title=" + title + ", writer=" + writer + ", cont="
				+ cont + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", ep_code=" + ep_code + ", app_result="
				+ app_result + "]";
	}

	
	
	
}
