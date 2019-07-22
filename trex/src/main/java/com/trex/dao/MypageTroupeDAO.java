package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.MypageTroupeVO;

public interface MypageTroupeDAO {

	// TroupeVO 리스트
	List<MypageTroupeVO> selectTroupeList() throws SQLException;

	void updateTroupe(MypageTroupeVO tro_code) throws SQLException;

	void deleteTroupe(String troupe_code) throws SQLException;

	MypageTroupeVO selectTroupeByName(String troupe_code) throws SQLException;
}
