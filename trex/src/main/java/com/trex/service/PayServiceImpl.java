package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.PayDAO;
import com.trex.dto.PayVO;

public class PayServiceImpl implements PayService {
	
	@Autowired
	private PayDAO payDAO;
	public void setPayDAO(PayDAO payDAO) {
		this.payDAO = payDAO;
	}

	@Override
	public List<PayVO> payList(String pay_code) throws SQLException {
		List<PayVO> payList = payDAO.selectPayList(pay_code);
		return payList;
	}

	@Override
	public PayVO payDetail(int pay_num) throws SQLException {
		PayVO pay = payDAO.selecePayBypay_num(pay_num);
		return pay;
	}

	@Override
	public void insert(PayVO pay) throws SQLException {
		payDAO.insertPay(pay);
	}

	@Override
	public void remove(int pay_num) throws SQLException {
		payDAO.deletePay(pay_num);
	}

}
