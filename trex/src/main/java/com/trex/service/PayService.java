package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.PayVO;

public interface PayService {

	public List<PayVO> payList(String pay_code) throws SQLException;
	public PayVO payDetail(int pay_num) throws SQLException;
	
	void insert(PayVO pay) throws SQLException;
	void remove(int pay_num) throws SQLException;
}
