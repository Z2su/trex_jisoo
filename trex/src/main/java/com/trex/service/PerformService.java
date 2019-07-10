package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PerformVO;

public interface PerformService {
	List<PerformVO> getPFList() throws SQLException;
	PerformVO getPF(String pf_code) throws SQLException;

}
