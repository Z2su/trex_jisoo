package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PayVO;

public interface PayDAO {

	public List<PayVO> selectPayList(String pay_code) throws SQLException;
	PayVO selecePayBypay_num(int pay_num) throws SQLException;
	
	void insertPay(PayVO pay) throws SQLException;
	void deletePay(int pay_num) throws SQLException;
	
	int selecePaySeqNext() throws SQLException;
}
