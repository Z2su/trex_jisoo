package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CrshVO;
import com.trex.dto.CrshVO;

public interface CrshService {

	List<CrshVO> getList() throws Exception;
	CrshVO getcrsh(String crsh_code)throws SQLException;	
	
	void write(CrshVO crsh) throws SQLException;
	void remove(String crsh_code) throws SQLException;

}
