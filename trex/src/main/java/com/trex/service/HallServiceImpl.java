package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dao.HallDAO;
import com.trex.dto.HallVO;

public class HallServiceImpl implements HallService {
	
	private HallDAO HallDAO;
	public void setHallDAO(HallDAO HallDAO) {
		this.HallDAO = HallDAO;
	}

	@Override
	public List<HallVO> getBoardList() throws Exception {
		List<HallVO> HallList = HallDAO.selectHallList();
		return HallList;
	}

	@Override
	public HallVO readBoard(String hall_code) throws SQLException {
		HallVO Hall = HallDAO.selectHall(hall_code);
		return Hall;
	}

	@Override
	public HallVO getBoardForModify(String hall_code) throws SQLException {
		HallVO Hall = HallDAO.selectHall(hall_code);
		
		return Hall;
	}

	@Override
	public void write(HallVO hall) throws SQLException {
		int num=HallDAO.selectHallNextSeq();
		
		String code = "HALL"+ String.format("%04d", num);
		hall.setHall_num(num);
		hall.setHall_code(code);
		
		HallDAO.insertHall(hall);

	}

	@Override
	public void modify(HallVO hall) throws SQLException {
		HallDAO.updateHall(hall);

	}

	@Override
	public void remove(String hall_code) throws SQLException {
		HallDAO.deleteHall(hall_code);

	}

}
