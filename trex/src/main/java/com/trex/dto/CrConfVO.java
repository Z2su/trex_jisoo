package com.trex.dto;

public class CrConfVO {
	
	private String conf_code;
	private int conf_num;
	private int result;
	private String ep_code;
	private String cr_app_code;
	
	public String getConf_code() {
		return conf_code;
	}
	public void setConf_code(String conf_code) {
		this.conf_code = conf_code;
	}
	public int getConf_num() {
		return conf_num;
	}
	public void setConf_num(int conf_num) {
		this.conf_num = conf_num;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getEp_code() {
		return ep_code;
	}
	public void setEp_code(String ep_code) {
		this.ep_code = ep_code;
	}
	public String getCr_app_code() {
		return cr_app_code;
	}
	public void setCr_app_code(String cr_app_code) {
		this.cr_app_code = cr_app_code;
	}
	@Override
	public String toString() {
		return "CrConfVO [conf_code=" + conf_code + ", conf_num=" + conf_num + ", result=" + result + ", ep_code="
				+ ep_code + ", cr_app_code=" + cr_app_code + "]";
	}
	
	

}
