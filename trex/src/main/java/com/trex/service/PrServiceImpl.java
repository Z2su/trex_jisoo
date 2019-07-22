package com.trex.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dao.PrDAO;
import com.trex.dto.PrVO;
import com.trex.request.Criteria;
import com.trex.request.PageMaker;

public class PrServiceImpl implements PrService {

	
	@Autowired
	private PrDAO prDAO;
	public void setPrDAO(PrDAO prDAO) {
		this.prDAO = prDAO;
	}
	/*@Override
	public List<PrVO> prList(Criteria cri) throws SQLException {
		List<PrVO> prList = prDAO.selectPrList();
		return prList;
	}*/

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
	@Override
	public Map<String, Object> getPrList(Criteria cri) throws SQLException {
		List<PrVO> prList = prDAO.selectSearchPrList(cri);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(prDAO.selectSearchPrListCount(cri));
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("prList", prList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	

	
	

}
