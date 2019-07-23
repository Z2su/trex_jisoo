package com.trex.dto;

public class PerformReservationVO {
	
	private String pf_code;
	private String pfsh_code;
	private String mem_id;
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "PerformReservationVO [pf_code=" + pf_code + ", pfsh_code=" + pfsh_code + ", mem_id=" + mem_id + "]";
	}
	
	

}
