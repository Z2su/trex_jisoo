package com.trex.dto;

public class SeatReqVO {
	private String grade;
	private String price;
	private int count;
	private String col;
	private int num;
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
	public String getCol() {
		return col;
	}
	public void setCol(String col) {
		this.col = col;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "SeatReqVO [grade=" + grade + ", price=" + price + ", count=" + count + ", col=" + col + ", num=" + num
				+ "]";
	}
	
	
	
	

}
