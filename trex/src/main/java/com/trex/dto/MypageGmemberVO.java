package com.trex.dto;

public class MypageGmemberVO {

	private String gmem_code;
	private String name;
	private int birth;
	private String address;
	private String gender;
	private String tell;
	private int mile;
	private int gra_code;

	public String getGmem_code() {
		return gmem_code;
	}

	public void setGmem_code(String gmem_code) {
		this.gmem_code = gmem_code;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public int getMile() {
		return mile;
	}

	public void setMile(int mile) {
		this.mile = mile;
	}

	public int getGra_code() {
		return gra_code;
	}

	public void setGra_code(int gra_code) {
		this.gra_code = gra_code;
	}

	@Override
	public String toString() {
		return "MypageMemberVO [gmem_code=" + gmem_code + ", name=" + name + ", birth=" + birth + ", address=" + address
				+ ", gender=" + gender + ", tell=" + tell + ", mile=" + mile + ", gra_code=" + gra_code + "]";
	}
}
