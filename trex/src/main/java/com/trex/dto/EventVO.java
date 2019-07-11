package com.trex.dto;

import java.sql.Date;
import java.util.List;

public class EventVO {

	private String event_code;	// 게시판 코드
	private int event_num;	// 이밴트 번호
	private String title;		// 게시물 제목
	private String writer;		// 글쓴이
	private String cont;		// 내용
	private Date regdate;		// 등록날짜
	private Date modidate;		// 수정날짜
	private int viewcnt;		// 조회수
	private int enable;			// 상태
	private Date startdate;		// 이벤트 시작일
	private Date enddate;		// 이벤트 종료일
	
	private List<AttachVO> attachList; // 첨부파일 리스트

	public String getEvent_code() {
		return event_code;
	}

	public void setEvent_code(String event_code) {
		this.event_code = event_code;
	}

	public int getEvent_num() {
		return event_num;
	}

	public void setEvent_num(int event_num) {
		this.event_num = event_num;
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

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
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

	public List<AttachVO> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}

	@Override
	public String toString() {
		return "EventVO [event_code=" + event_code + ", event_num=" + event_num + ", title=" + title + ", writer="
				+ writer + ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", viewcnt=" + viewcnt
				+ ", enable=" + enable + ", startdate=" + startdate + ", enddate=" + enddate + ", attachList="
				+ attachList + "]";
	}
	
	
	
}
