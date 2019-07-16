package com.trex.dto;

import java.util.Date;
import java.util.List;

public class NoticeVO {

	private String notice_code;
	private int notice_num;
	private String title;
	private String writer;
	private String cont;
	private Date regdate;
	private Date modidate;
	private int viewcnt;

	private List<AttachVO> attachList; // 첨부파일 리스트

	public NoticeVO() {}

	public NoticeVO(String notice_code, int notice_num, String title, String writer, String cont, Date regdate,
			Date modidate, int viewcnt, List<AttachVO> attachList) {
		
		super();
		this.notice_code = notice_code;
		this.notice_num = notice_num;
		this.title = title;
		this.writer = writer;
		this.cont = cont;
		this.regdate = regdate;
		this.modidate = modidate;
		this.viewcnt = viewcnt;
		this.attachList = attachList;
	}

	public List<AttachVO> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}

	public String getNotice_code() {
		return notice_code;
	}

	public void setNotice_code(String notice_code) {
		this.notice_code = notice_code;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
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
		return "NoticeVO [notice_code=" + notice_code + ", notice_num=" + notice_num + ", title=" + title + ", writer="
				+ writer + ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", viewcnt=" + viewcnt
				+ ", attachList=" + attachList + "]";
	}
}