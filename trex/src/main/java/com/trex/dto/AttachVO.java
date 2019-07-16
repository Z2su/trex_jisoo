package com.trex.dto;

import java.util.Date;

public class AttachVO {
	
	private String attach_code;
	private int attach_num;

	private String fileName;
	private String fileType;
	private long fileSize;
	private String filePath;
	
	private Date regDate;
	private String wirter;
	private String uuid;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getWirter() {
		return wirter;
	}
	public void setWirter(String wirter) {
		this.wirter = wirter;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	@Override
	public String toString() {
		return "AttachVO [attach_code=" + attach_code + ", attach_num=" + attach_num + ", fileName=" + fileName
				+ ", fileType=" + fileType + ", fileSize=" + fileSize + ", filePath=" + filePath + ", regDate="
				+ regDate + ", wirter=" + wirter + ", uuid=" + uuid + ", post_code=" + post_code + "]";
	}
	
	
	
	
	
}
