package com.trex.dto;

public class EmployeeVO {
private String ep_code;
private int comp;
private String name;
private	String rank;
private String emp;
public String getEp_code() {
	return ep_code;
}
public void setEp_code(String ep_code) {
	this.ep_code = ep_code;
}
public int getComp() {
	return comp;
}
public void setComp(int comp) {
	this.comp = comp;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRank() {
	return rank;
}
public void setRank(String rank) {
	this.rank = rank;
}
public String getEmp() {
	return emp;
}
public void setEmp(String emp) {
	this.emp = emp;
}
@Override
public String toString() {
	return "EmployeeVO [ep_code=" + ep_code + ", comp=" + comp + ", name=" + name + ", rank=" + rank + ", emp=" + emp
			+ "]";
}



}


