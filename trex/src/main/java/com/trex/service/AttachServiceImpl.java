package com.trex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.AttachDAO;
import com.trex.dto.AttachVO;

public class AttachServiceImpl implements AttachService {

	@Autowired
	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public void insert(AttachVO attach) throws Exception {
		
		
	}

	@Override
	public AttachVO read(String attach_code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String attach_code) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AttachVO> AttachList(String post_code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}
