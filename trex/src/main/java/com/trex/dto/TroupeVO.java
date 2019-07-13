package com.trex.dto;

public class TroupeVO {

	private String tro_code;
	private String bupanum;
	private String name;
	public String getTro_code() {
		return tro_code;
	}
	public void setTro_code(String tro_code) {
		this.tro_code = tro_code;
	}
	public String getBupanum() {
		return bupanum;
	}
	public void setBupanum(String bupanum) {
		this.bupanum = bupanum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "TroupeVO [tro_code=" + tro_code + ", bupanum=" + bupanum + ", name=" + name + "]";
	}
	
	
}
