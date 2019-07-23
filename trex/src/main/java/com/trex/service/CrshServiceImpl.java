package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.CrshDAO;
import com.trex.dto.CrshVO;

public class CrshServiceImpl implements CrshService {

	
	@Autowired
	private CrshDAO crshDAO;
	public void setCrshDAO(CrshDAO crshDAO) {
		this.crshDAO = crshDAO;
	}
	
	@Override
	public List<CrshVO> getList() throws Exception {
		List<CrshVO> crshlist = crshDAO.selectList();
		return crshlist;
	}

	@Override
	public CrshVO getcrsh(String crsh_code) throws SQLException {
		CrshVO crsh = crshDAO.select(crsh_code);
		return crsh;
	}

	@Override
	public void write(CrshVO crsh) throws SQLException {
		int num = crshDAO.NextSeq();
		crsh.setCrsh_code("CRSH"+String.format("%04d", num));
		crsh.setCrsh_num(num);
		crshDAO.insert(crsh);
	}

	@Override
	public void remove(String crsh_code) throws SQLException {
		crshDAO.delete(crsh_code);
	}

}
