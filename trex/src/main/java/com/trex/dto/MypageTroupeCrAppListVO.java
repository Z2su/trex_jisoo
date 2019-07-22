package com.trex.dto;

import java.util.Date;

public class MypageTroupeCrAppListVO {

	private String cr_app_code;
	private int cr_app_num;
	private String hall_code;
	private String ep_code;
	private String writer;
	private String title;
	private String enable;
	private String cont;
	private Date regdate;
	private Date modidate;
	private String pf_code;
	private String pfsh_code;

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

	public String getHall_code() {
		return hall_code;
	}

	public void setHall_code(String hall_code) {
		this.hall_code = hall_code;
	}

	public String getEp_code() {
		return ep_code;
	}

	public void setEp_code(String ep_code) {
		this.ep_code = ep_code;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getPf_code() {
		return pf_code;
	}

	public void setPf_code(String pf_code) {
		this.pf_code = pf_code;
	}

	public String getPfsh_code() {
		return pfsh_code;
	}

	public void setPfsh_code(String pfsh_code) {
		this.pfsh_code = pfsh_code;
	}

	@Override
	public String toString() {
		return "CrAppVO [cr_app_code=" + cr_app_code + ", cr_app_num=" + cr_app_num + ", hall_code=" + hall_code
				+ ", ep_code=" + ep_code + ", writer=" + writer + ", title=" + title + ", enable=" + enable + ", cont="
				+ cont + ", regdate=" + regdate + ", modidate=" + modidate + ", pf_code=" + pf_code + ", pfsh_code="
				+ pfsh_code + "]";
	}
}
