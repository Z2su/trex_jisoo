package com.trex.dto;

public class HallVO {
	
	private String hall_code;
	private int hall_num;
	private String hall_name;
	private int seat;
	private String setarrangement;
	private int cr_price;
	
	public String getHall_code() {
		return hall_code;
	}
	public void setHall_code(String hall_code) {
		this.hall_code = hall_code;
	}
	public int getHall_num() {
		return hall_num;
	}
	public void setHall_num(int hall_num) {
		this.hall_num = hall_num;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public String getSetarrangement() {
		return setarrangement;
	}
	public void setSetarrangement(String setarrangement) {
		this.setarrangement = setarrangement;
	}
	public int getCr_price() {
		return cr_price;
	}
	public void setCr_price(int cr_price) {
		this.cr_price = cr_price;
	}
	@Override
	public String toString() {
		return "HallVO [hall_code=" + hall_code + ", hall_num=" + hall_num + ", hall_name=" + hall_name + ", seat="
				+ seat + ", setarrangement=" + setarrangement + ", cr_price=" + cr_price + "]";
	}
	
	
}
