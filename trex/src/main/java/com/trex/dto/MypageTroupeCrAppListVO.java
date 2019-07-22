package com.trex.dto;

import java.util.Date;

public class MypageTroupeCrAppListVO {

	private String cr_app_code;
	private int cr_app_num;
	private String title;
	private String writer;
	private String enable;
	private String cont;
	private Date regdate;
	private Date modidate;

	public String getCr_app_code() {
		return cr_app_code;
	}

	public void setCr_app_code(String cr_app_code) {
		this.cr_app_code = cr_app_code;
	}

	public int getCr_app_num() {
		return cr_app_num;
	}

	public void setCr_app_num(int cr_app_num) {
		this.cr_app_num = cr_app_num;
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

	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
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

	@Override
	public String toString() {
		return "MypageCrAppListVO [cr_app_code=" + cr_app_code + ", cr_app_num=" + cr_app_num + ", title=" + title
				+ ", writer=" + writer + ", enable=" + enable + ", cont=" + cont + ", regdate=" + regdate
				+ ", modidate=" + modidate + "]";
	}

}
