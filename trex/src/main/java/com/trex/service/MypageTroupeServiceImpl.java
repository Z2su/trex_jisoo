package com.trex.service;

import java.sql.SQLException;

import com.trex.dao.MypageTroupeDAO;
import com.trex.dto.MypageTroupeVO;

public class MypageTroupeServiceImpl implements MypageTroupeService {

	// MypageTroureDAO
	private MypageTroupeDAO MypageTroupeDAO;

	public void setTroupeDAO(MypageTroupeDAO MypageTroupeDAO) {
		this.MypageTroupeDAO = MypageTroupeDAO;
	}

	@Override
	public MypageTroupeVO gettroupe(String tro_code) throws SQLException {
		return MypageTroupeDAO.selectTroupeByName(tro_code);
	}

	@Override
	public void modify(MypageTroupeVO tro_code) throws SQLException {
		MypageTroupeDAO.updateTroupe(tro_code);
	}

	@Override
	public void remove(String tro_code) throws SQLException {
		MypageTroupeDAO.deleteTroupe(tro_code);
	}
}
