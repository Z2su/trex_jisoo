package com.trex.controller;

import org.springframework.web.multipart.MultipartFile;

import com.trex.dto.MailVO;

public class MailRequest {
	
	private String sender;
	private String receiver;
	private String title;
	private String content;
	
	private MultipartFile file;
	
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public MailVO toMailVO() {
		MailVO vo = new MailVO();
		vo.setContent(content);
		vo.setReceiver(receiver);
		vo.setSender(sender);
		vo.setTitle(title);
		vo.setFile(file.getOriginalFilename());
		
		return vo;
	}
	

}
