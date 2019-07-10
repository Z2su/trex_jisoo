package com.trex.dto;

public class QnABoardVO {
	private String qna_code;
	private int qna_num;
	private String title;
	private String writer;
	private String cont;
	private String regdate;
	private String modidate;
	private String viewcnt;
	public String getQna_code() {
		return qna_code;
	}
	public void setQna_code(String qna_code) {
		this.qna_code = qna_code;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModidate() {
		return modidate;
	}
	public void setModidate(String modidate) {
		this.modidate = modidate;
	}
	public String getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(String viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "QnABoardVO [qna_code=" + qna_code + ", qna_num=" + qna_num + ", title=" + title + ", writer=" + writer
				+ ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", viewcnt=" + viewcnt + "]";
	}

}
