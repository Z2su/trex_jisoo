package com.trex.dto;

public class SeatReqVO {
	private String grade;
	private String price;
	private int count;
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "SeatReqVO [grade=" + grade + ", price=" + price + ", count=" + count + "]";
	}
	
	

}
