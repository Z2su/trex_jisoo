package com.trex.dto;

import java.util.Date;

public class MemberVO {
	
	private String mem_code;
	private String mem_id;
	private String mem_pwd;
	private String mem_email;
	private String mem_enable;
	private Date mem_regdate;

	private String authkey;
	private int authstatus;

	public Date login_date;

	
	
	
	public int getAuthstatus() {
		return authstatus;
	}
	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_enable() {
		return mem_enable;
	}
	public void setMem_enable(String mem_enable) {
		this.mem_enable = mem_enable;
	}
	public Date getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}

	
	
	public Date getLogin_date() {
		return login_date;
	}
	public void setLogin_date(Date login_date) {
		this.login_date = login_date;

	}
	@Override
	public String toString() {
		return "MemberVO [mem_code=" + mem_code + ", mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_email="
				+ mem_email + ", mem_enable=" + mem_enable + ", mem_regdate=" + mem_regdate + ", authkey=" + authkey
				+ ", authstatus=" + authstatus + ", login_date=" + login_date + "]";
	}

}
