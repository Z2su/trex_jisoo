package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PFSHViewVO;

public interface PerformReservationDAO {
	
	List<PFSHViewVO> selectPFSHViewList(String pf_code) throws SQLException;
	PFSHViewVO selectPFSHView(String pfsh_code) throws SQLException;

}
