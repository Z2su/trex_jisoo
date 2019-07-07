package com.trex.dto;

public class PerformVO {
	private String pf_code;
	private int pf_num;
	private String name;
	private String cont;
	private String cls;
	private int runtime;
	private String hall_code;
	private String crsh_code;
	
	public String getPf_code() {
		return pf_code;
	}

	public void setPf_code(String pf_code) {
		this.pf_code = pf_code;
	}

	public int getPf_num() {
		return pf_num;
	}

	public void setPf_num(int pf_num) {
		this.pf_num = pf_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getHall_code() {
		return hall_code;
	}

	public void setHall_code(String hall_code) {
		this.hall_code = hall_code;
	}

	public String getCrsh_code() {
		return crsh_code;
	}

	public void setCrsh_code(String crsh_code) {
		this.crsh_code = crsh_code;
	}

	@Override
	public String toString() {
		return "PerformVO [pf_code=" + pf_code + ", pf_num=" + pf_num + ", name=" + name + ", cont=" + cont + ", cls="
				+ cls + ", runtime=" + runtime + ", hall_code=" + hall_code + ", crsh_code=" + crsh_code + "]";
	}

	public void toPFGBoard(PerformGuidBoardVO PFGBoard) {
		PFGBoard.setName(this.name);
		PFGBoard.setCont(this.cont);
		PFGBoard.setRuntime(this.runtime);
		PFGBoard.setCls(this.cls);
		PFGBoard.setPf_code(this.pf_code);
		
	}
	
}
