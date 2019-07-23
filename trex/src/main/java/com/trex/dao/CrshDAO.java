package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.CrshVO;

public interface CrshDAO {
	
	List<CrshVO> selectList() throws SQLException;
	CrshVO select(String crsh_code) throws SQLException;
	
	void insert(CrshVO CRSH) throws SQLException;
	
	void delete(String crsh_code) throws SQLException;
		
	int NextSeq() throws SQLException;

}
