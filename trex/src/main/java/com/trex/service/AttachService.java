package com.trex.service;

import java.util.List;

import com.trex.dto.AttachVO;

public interface AttachService {
	
 void insert(AttachVO attach) throws Exception;
 AttachVO read(String attach_code) throws Exception;
 void delete(String attach_code)throws Exception;
 List<AttachVO> AttachList(String post_code)throws Exception;
 
}
