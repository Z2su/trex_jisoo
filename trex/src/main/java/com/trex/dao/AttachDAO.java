package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.AttachVO;



public interface AttachDAO {

	public List<AttachVO> selectAttachesByAttachCode(String attach_code)throws SQLException;
	public AttachVO selectAttachByPostcode(String post_code)throws SQLException;
	
	public void insertAttach(AttachVO attach) throws SQLException;

	public void deleteAttach(String attach_code) throws SQLException;

	public void deleteAllAttach(String attach_code)throws SQLException;
	
}
