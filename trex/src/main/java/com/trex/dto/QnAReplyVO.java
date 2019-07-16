package com.trex.dto;

import java.util.Date;

public class QnAReplyVO {
private String rep_code;
private int	rep_num;
private String title;
private String writer;
private String cont;
private Date regdate;
private Date modidate;
private int	viewcnt;
private String qna_code;
public String getRep_code() {
	return rep_code;
}
public void setRep_code(String rep_code) {
	this.rep_code = rep_code;
}
public int getRep_num() {
	return rep_num;
}
public void setRep_num(int rep_num) {
	this.rep_num = rep_num;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getCont() {
	return cont;
}
public void setCont(String cont) {
	this.cont = cont;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
public Date getModidate() {
	return modidate;
}
public void setModidate(Date modidate) {
	this.modidate = modidate;
}
public int getViewcnt() {
	return viewcnt;
}
public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}
public String getQna_code() {
	return qna_code;
}
public void setQna_code(String qna_code) {
	this.qna_code = qna_code;
}
@Override
public String toString() {
	return "QnAReplyVO [rep_code=" + rep_code + ", rep_num=" + rep_num + ", title=" + title + ", writer=" + writer
			+ ", cont=" + cont + ", regdate=" + regdate + ", modidate=" + modidate + ", viewcnt=" + viewcnt
			+ ", qna_code=" + qna_code + "]";
}


}
