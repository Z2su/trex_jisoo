package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.PrVO;
import com.trex.request.Criteria;

public class PrDAOImpl implements PrDAO {
	
	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<PrVO> selectPrList() throws SQLException {
		List<PrVO> prList = session.selectList("Pr-Mapper.selectPrList",null);
		return prList;
	}

	@Override
	public PrVO selectPrBypr_num(int pr_num) throws SQLException {
		PrVO pr = session.selectOne("Pr-Mapper.selectPrBypr_num",pr_num);
		return pr;
	}

	@Override
	public void insertPr(PrVO pr) throws SQLException {
		session.update("Pr-Mapper.insertPr",pr);

	}

	@Override
	public void updatePr(PrVO pr) throws SQLException {
		session.update("Pr-Mapper.updatePr",pr);

	}

	@Override
	public void deletePr(int pr_num) throws SQLException {
		session.update("Pr-Mapper.deletePr",pr_num);

	}

	@Override
	public void increaseViewCnt(int pr_num) throws SQLException {
		session.update("Pr-Mapper.increaseViewCnt",pr_num);

	}

	@Override
	public int selectPrSeqNext() throws SQLException {
		int pr_num = session.selectOne("Pr-Mapper.selectPrSeqNext");
		return pr_num;
	}

	@Override
	public List<PrVO> selectSearchPrList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();		
		int limit=cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<PrVO> prList = session.selectList("Pr-Mapper.selectSearchPrList",cri,rowBounds);
		
		return prList;
	}

	@Override
	public int selectSearchPrListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Pr-Mapper.selectSearchPrListCount",cri);
		return count;
	}

	@Override
	public List<PrVO> selectPointPrList(Criteria cri) throws SQLException {
		List<PrVO> prList = session.selectList("Pr-Mapper.selectPointPrList",cri);		
		return prList;
	}

	

	

}
