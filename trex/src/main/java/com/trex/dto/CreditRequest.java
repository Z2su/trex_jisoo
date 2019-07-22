package com.trex.dto;

public class CreditRequest {

	private String sndGoodname;		// 상품명
	private String sndAmount;		// 가격 
	private String sndOrdername;	// 주문자명
	private String sndEmail;		// 이메일
	private String sndMobile;		// 전화번호
	private String sndOrderNumber;	// 주문번호
	private String sndStoreid="2999199999";		// 가맹점ID
	private String sndAddress;		// 고객주소
	
	public String getSndAddress() {
		return sndAddress;
	}
	public void setSndAddress(String sndAddress) {
		this.sndAddress = sndAddress;
	}
	public String getSndGoodname() {
		return sndGoodname;
	}
	public void setSndGoodname(String sndGoodname) {
		this.sndGoodname = sndGoodname;
	}
	public String getSndAmount() {
		return sndAmount;
	}
	public void setSndAmount(String sndAmount) {
		this.sndAmount = sndAmount;
	}
	public String getSndOrdername() {
		return sndOrdername;
	}
	public void setSndOrdername(String sndOrdername) {
		this.sndOrdername = sndOrdername;
	}
	public String getSndEmail() {
		return sndEmail;
	}
	public void setSndEmail(String sndEmail) {
		this.sndEmail = sndEmail;
	}
	
	public String getSndOrderNumber() {
		return sndOrderNumber;
	}
	public void setSndOrderNumber(String sndOrderNumber) {
		this.sndOrderNumber = sndOrderNumber;
	}
	public String getSndStoreid() {
		return sndStoreid;
	}
	public void setSndStoreid(String sndStoreid) {
		this.sndStoreid = sndStoreid;
	}
	public String getSndMobile() {
		return sndMobile;
	}
	public void setSndMobile(String sndMobile) {
		this.sndMobile = sndMobile;
	}
	@Override
	public String toString() {
		return "CreditRequest [sndGoodname=" + sndGoodname + ", sndAmount=" + sndAmount + ", sndOrdername="
				+ sndOrdername + ", sndEmail=" + sndEmail + ", sndMobile=" + sndMobile + ", sndOrderNumber="
				+ sndOrderNumber + ", sndStoreid=" + sndStoreid + ", sndAddress=" + sndAddress + "]";
	}
	
	
	
	
	
	
}
