package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.PayVO;

public class PayDAOImpl implements PayDAO {

	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PayVO> selectPayList(String pay_code) throws SQLException {
		List<PayVO> payList = session.selectList("Pay-Mapper.selectPayList");
		
		return payList;
		
	}

	@Override
	public PayVO selecePayBypay_num(int pay_num) throws SQLException {
		PayVO pay = session.selectOne("Pay-Mapper.selectPayBypay_num",pay_num);
		return pay;
	}

	@Override
	public void insertPay(PayVO pay) throws SQLException {
		session.update("Pay-Mapper.insertPay", pay);
	}

	@Override
	public void deletePay(int pay_num) throws SQLException {
		session.update("Pay-Mapper.deletePay",pay_num);
	}

	@Override
	public int selecePaySeqNext() throws SQLException {
		int pay_num = session.selectOne("Pay-Mapper.selectPaySeqNext");
		return pay_num;
	}

}
