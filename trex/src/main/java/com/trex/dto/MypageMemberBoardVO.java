package com.trex.dto;

import java.util.Date;

public class MypageMemberBoardVO {

	private String qna_code;
	private int qna_num;
	private String title;
	private String writer;
	private String cont;
	private Date regdate;
	private Date modidate;
	private int veiwcnt;

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

	public int getVeiwcnt() {
		return veiwcnt;
	}

	public void setVeiwcnt(int veiwcnt) {
		this.veiwcnt = veiwcnt;
	}

	@Override
	public String toString() {
		return "MypageMemberBoardVO [qna_code=" + qna_code + ", qna_num=" + qna_num + ", title=" + title + ", writer="
				+ writer + ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", veiwcnt=" + veiwcnt
				+ "]";
	}

}
