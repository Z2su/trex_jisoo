package com.trex.dto;

public class SeatReqVO {
	private String grade;
	private String price;
	private int count;
	private String col;
	private int num;
	private int pfshs_rese;
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
	
	public int getPfshs_rese() {
		return pfshs_rese;
	}
	public void setPfshs_rese(int pfshs_rese) {
		this.pfshs_rese = pfshs_rese;
	}
	@Override
	public String toString() {
		return "SeatReqVO [grade=" + grade + ", price=" + price + ", count=" + count + ", col=" + col + ", num=" + num
				+ ", pfshs_rese=" + pfshs_rese + "]";
	}
	
	
	
	

}
