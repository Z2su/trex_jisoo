package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.MypageTroupeCrAppListVO;
import com.trex.request.Criteria;

public interface MypageTroupeCrAppService {

	public List<MypageTroupeCrAppListVO> getBoardList() throws Exception;
	MypageTroupeCrAppListVO readBoard(String cr_app_code)throws SQLException;	
	MypageTroupeCrAppListVO getBoardForModify(String cr_app_code)throws SQLException;	
	
	void write(MypageTroupeCrAppListVO board) throws SQLException;
	void modify(MypageTroupeCrAppListVO board) throws SQLException;
	void remove(String cr_app_code) throws SQLException;
}
