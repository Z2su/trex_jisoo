package com.trex.dto;

import java.util.Date;

public class PayVO {

	private String pay_code;
	private int pay_num;
	private String pay_math;
	private Date pay_date;
	private int pay_price;
	
	public String getPay_code() {
		return pay_code;
	}
	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getPay_math() {
		return pay_math;
	}
	public void setPay_math(String pay_math) {
		this.pay_math = pay_math;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	@Override
	public String toString() {
		return "PayVO [pay_code=" + pay_code + ", pay_num=" + pay_num + ", pay_math=" + pay_math + ", pay_date="
				+ pay_date + ", pay_price=" + pay_price + "]";
	}
	
	
}
