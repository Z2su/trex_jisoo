package com.trex.dto;

public class RHVO {
	
	private String rh_code;
	private int rh_num;
	private String status;
	private int pay_price;
	private int use_mile;
	private int tot_price;
	private String pay_code;
	private String gmem_code;
	private String pfsh_code;
	
	public RHVO() {}
	
	public RHVO(int pay_price, String pay_code, String gmem_code, String pfsh_code) {
		super();
		this.pay_price = pay_price;
		this.pay_code = pay_code;
		this.gmem_code = gmem_code;
		this.pfsh_code = pfsh_code;
	}
	public String getRh_code() {
		return rh_code;
	}
	public void setRh_code(String rh_code) {
		this.rh_code = rh_code;
	}
	public int getRh_num() {
		return rh_num;
	}
	public void setRh_num(int rh_num) {
		this.rh_num = rh_num;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public int getUse_mile() {
		return use_mile;
	}
	public void setUse_mile(int use_mile) {
		this.use_mile = use_mile;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
	public String getPay_code() {
		return pay_code;
	}
	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}
	public String getGmem_code() {
		return gmem_code;
	}
	public void setGmem_code(String gmem_code) {
		this.gmem_code = gmem_code;
	}
	public String getPfsh_code() {
		return pfsh_code;
	}
	public void setPfsh_code(String pfsh_code) {
		this.pfsh_code = pfsh_code;
	}
	@Override
	public String toString() {
		return "RHVO [rh_code=" + rh_code + ", rh_num=" + rh_num + ", status=" + status + ", pay_price=" + pay_price
				+ ", use_mile=" + use_mile + ", tot_price=" + tot_price + ", pay_code=" + pay_code + ", gmem_code="
				+ gmem_code + ", pfsh_code=" + pfsh_code + "]";
	}
	

}
