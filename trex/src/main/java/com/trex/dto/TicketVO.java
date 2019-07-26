package com.trex.dto;

public class TicketVO {
	private String seat_code;
	private String rh_code;
	private String ticket_code;
	
	public TicketVO() {}
	
	
	public TicketVO(String seat_code, String rh_code) {
		super();
		this.seat_code = seat_code;
		this.rh_code = rh_code;
	
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	public String getRh_code() {
		return rh_code;
	}
	public void setRh_code(String rh_code) {
		this.rh_code = rh_code;
	}
	public String getTicket_code() {
		return ticket_code;
	}
	public void setTicket_code(String ticket_code) {
		this.ticket_code = ticket_code;
	}
	@Override
	public String toString() {
		return "TicketVO [seat_code=" + seat_code + ", rh_code=" + rh_code + ", ticket_code=" + ticket_code + "]";
	}
	
	

}
