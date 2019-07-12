package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.PrDAO;
import com.trex.dto.PrVO;

public class PrServiceImpl implements PrService {

	
	@Autowired
	private PrDAO prDAO;
	public void setPrDAO(PrDAO prDAO) {
		this.prDAO = prDAO;
	}
	@Override
	public List<PrVO> prList() throws SQLException {
		List<PrVO> prList = prDAO.selectPrList();
		return prList;
	}

	@Override
	public PrVO prDetail(int pr_num) throws SQLException {
		PrVO pr = prDAO.selectPrBypr_num(pr_num);
		return pr;
	}

	@Override
	public void write(PrVO pr) throws SQLException {
		int pr_num = prDAO.selectPrSeqNext();
		String code = "PRE"+ String.format("%04d", pr_num);
		pr.setPr_code(code);
		pr.setPr_num(pr_num);
		
		prDAO.insertPr(pr);

	}

	@Override
	public void modify(PrVO pr) throws SQLException {
		prDAO.updatePr(pr);
	}

	@Override
	public void remove(int pr_num) throws SQLException {
		prDAO.deletePr(pr_num);
	}

}
