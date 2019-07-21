package com.trex.dto;

public class EPViewVO {
private String ep_code;
private String comp;
private String name;
private String rank;
private String emp;
private String mem_code;
private String mem_id;
private String mem_pwd;
private String mem_enable;
private String mem_reg_date;
private String login_date;
private String conf_status;
private String conf_code;
private String mem_email;
public String getEp_code() {
	return ep_code;
}
public void setEp_code(String ep_code) {
	this.ep_code = ep_code;
}
public String getComp() {
	return comp;
}
public void setComp(String comp) {
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
public String getMem_code() {
	return mem_code;
}
public void setMem_code(String mem_code) {
	this.mem_code = mem_code;
}
public String getMem_id() {
	return mem_id;
}
public void setMem_id(String mem_id) {
	this.mem_id = mem_id;
}
public String getMem_pwd() {
	return mem_pwd;
}
public void setMem_pwd(String mem_pwd) {
	this.mem_pwd = mem_pwd;
}
public String getMem_enable() {
	return mem_enable;
}
public void setMem_enable(String mem_enable) {
	this.mem_enable = mem_enable;
}
public String getMem_reg_date() {
	return mem_reg_date;
}
public void setMem_reg_date(String mem_reg_date) {
	this.mem_reg_date = mem_reg_date;
}
public String getLogin_date() {
	return login_date;
}
public void setLogin_date(String login_date) {
	this.login_date = login_date;
}
public String getConf_status() {
	return conf_status;
}
public void setConf_status(String conf_status) {
	this.conf_status = conf_status;
}
public String getConf_code() {
	return conf_code;
}
public void setConf_code(String conf_code) {
	this.conf_code = conf_code;
}
public String getMem_email() {
	return mem_email;
}
public void setMem_email(String mem_email) {
	this.mem_email = mem_email;
}
@Override
public String toString() {
	return "EPViewVO [ep_code=" + ep_code + ", comp=" + comp + ", name=" + name + ", rank=" + rank + ", emp=" + emp
			+ ", mem_code=" + mem_code + ", mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_enable=" + mem_enable
			+ ", mem_reg_date=" + mem_reg_date + ", login_date=" + login_date + ", conf_status=" + conf_status
			+ ", conf_code=" + conf_code + ", mem_email=" + mem_email + "]";
}


}
