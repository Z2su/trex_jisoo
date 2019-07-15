package com.trex.dto;

import java.util.Date;

public class CoronationVO {
	
	private String crg_code;	// 글 코드
	private int crg_num;	//글 번호
	private String title;	// 글 제목
	private String writer;	// 작성자
	private String cont;	// 내용
	private int viewcnt;	// 조회수
	private String hall_code;	// 공연장 번호
	private Date regDate;	// 등록일
	private Date modiDate;	// 수정일
	
	public String getCrg_code() {
		return crg_code;
	}
	public void setCrg_code(String crg_code) {
		this.crg_code = crg_code;
	}
	public int getCrg_num() {
		return crg_num;
	}
	public void setCrg_num(int crg_num) {
		this.crg_num = crg_num;
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getHall_code() {
		return hall_code;
	}
	public void setHall_code(String hall_code) {
		this.hall_code = hall_code;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModiDate() {
		return modiDate;
	}
	public void setModiDate(Date modiDate) {
		this.modiDate = modiDate;
	}
	@Override
	public String toString() {
		return "CrgVO [crg_code=" + crg_code + ", crg_num=" + crg_num + ", title=" + title + ", writer=" + writer
				+ ", cont=" + cont + ", viewcnt=" + viewcnt + ", hall_code=" + hall_code + ", regDate=" + regDate
				+ ", modiDate=" + modiDate + "]";
	}
	
	
}
