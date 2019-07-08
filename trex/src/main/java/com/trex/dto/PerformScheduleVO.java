package com.trex.dto;

import java.util.Date;

public class PerformScheduleVO {
	private String pfsh_code;
	private int pfsh_num;
	private Date starttime;
	private Date endtime;
	private Date rundate;
	private int runround;
	private String pf_code;
	public String getPfsh_code() {
		return pfsh_code;
	}
	public void setPfsh_code(String pfsh_code) {
		this.pfsh_code = pfsh_code;
	}
	public int getPfsh_num() {
		return pfsh_num;
	}
	public void setPfsh_num(int pfsh_num) {
		this.pfsh_num = pfsh_num;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Date getRundate() {
		return rundate;
	}
	public void setRundate(Date rundate) {
		this.rundate = rundate;
	}
	public int getRunround() {
		return runround;
	}
	public void setRunround(int runround) {
		this.runround = runround;
	}
	public String getPf_code() {
		return pf_code;
	}
	public void setPf_code(String pf_code) {
		this.pf_code = pf_code;
	}
	@Override
	public String toString() {
		return "PerformScheduleVO [pfsh_code=" + pfsh_code + ", pfsh_num=" + pfsh_num + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", rundate=" + rundate + ", runround=" + runround + ", pf_code=" + pf_code
				+ "]";
	}
	
	public void toPFGBoard(PerformGuidBoardVO PFGBoard) {
		
		PFGBoard.setStarttime(this.starttime);
		PFGBoard.setRundate(this.rundate);
	
		
	}
}
