package com.trex.dto;

public class MypageRhVO {

	private String rh_code;
	private int rh_num;
	private String status;
	private int code;
	private int use_mile;
	private int top_price;
	private String pay_code;
	private String gmem_code;
	private String pfsh_code;

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

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getUse_mile() {
		return use_mile;
	}

	public void setUse_mile(int use_mile) {
		this.use_mile = use_mile;
	}

	public int getTop_price() {
		return top_price;
	}

	public void setTop_price(int top_price) {
		this.top_price = top_price;
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
		return "MypageMemberRhVO [rh_code=" + rh_code + ", rh_num=" + rh_num + ", status=" + status + ", code=" + code
				+ ", use_mile=" + use_mile + ", top_price=" + top_price + ", pay_code=" + pay_code + ", gmem_code="
				+ gmem_code + ", pfsh_code=" + pfsh_code + "]";
	}
}