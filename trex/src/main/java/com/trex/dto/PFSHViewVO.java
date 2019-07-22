package com.trex.dto;

import java.util.Date;

public class PFSHViewVO {
	private String pf_code;
	private String title;
	private String cont;
	private Date rundate;
	private Date starttime;
	private String hall_name;
	private String hall_code;
	private int seat;
	private int runtime;
	private String cls;
	private String pfsh_code;
	public String getPf_code() {
		return pf_code;
	}
	public void setPf_code(String pf_code) {
		this.pf_code = pf_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getRundate() {
		return rundate;
	}
	public void setRundate(Date rundate) {
		this.rundate = rundate;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	public String getHall_code() {
		return hall_code;
	}
	public void setHall_code(String hall_code) {
		this.hall_code = hall_code;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public String getCls() {
		return cls;
	}
	public void setCls(String cls) {
		this.cls = cls;
	}
	public String getPfsh_code() {
		return pfsh_code;
	}
	public void setPfsh_code(String pfsh_code) {
		this.pfsh_code = pfsh_code;
	}
	@Override
	public String toString() {
		return "PFSHViewVO [pf_code=" + pf_code + ", title=" + title + ", cont=" + cont + ", rundate=" + rundate
				+ ", starttime=" + starttime + ", hall_name=" + hall_name + ", hall_code=" + hall_code + ", seat="
				+ seat + ", runtime=" + runtime + ", cls=" + cls + ", pfsh_code=" + pfsh_code + "]";
	}
	
	
	

}
