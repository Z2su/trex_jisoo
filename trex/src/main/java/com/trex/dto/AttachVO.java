package com.trex.dto;

import java.util.Date;

public class AttachVO {

	private String attach_code;
	private int attach_num;
	private String filename;
	private String filetype;
	private int filesize;
	private String filepath;
	private String writer;
	private Date regdate;
	private String attach_uuid;
	private String post_code;
	public String getAttach_code() {
		return attach_code;
	}
	public void setAttach_code(String attach_code) {
		this.attach_code = attach_code;
	}
	public int getAttach_num() {
		return attach_num;
	}
	public void setAttach_num(int attach_num) {
		this.attach_num = attach_num;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getAttach_uuid() {
		return attach_uuid;
	}
	public void setAttach_uuid(String attach_uuid) {
		this.attach_uuid = attach_uuid;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	@Override
	public String toString() {
		return "AttachVO [attach_code=" + attach_code + ", attach_num=" + attach_num + ", filename=" + filename
				+ ", filetype=" + filetype + ", filesize=" + filesize + ", filepath=" + filepath + ", writer=" + writer
				+ ", regdate=" + regdate + ", attach_uuid=" + attach_uuid + ", post_code=" + post_code + "]";
	}
	
	
	
}
