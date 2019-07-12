package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.CoronationVO;

public class CoronationDAOImpl implements CoronationDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<CoronationVO> selectCRGBoardList() throws SQLException {
		
		List<CoronationVO> CRGBoardList = session.selectList("CRG-Mapper.selectCRGBoardList",null);
		
		return CRGBoardList;
	}

	@Override
	public CoronationVO selectCRGBoard(String crg_code) throws SQLException {
		
		CoronationVO CRGBoard = session.selectOne("CRG-Mapper.selectCRGBoard",crg_code);
		
		return CRGBoard;
	}

	@Override
	public void insertCRGBoard(CoronationVO CRGBoard) throws SQLException {
		session.update("CRG-Mapper.insertCRGBoard",CRGBoard);

	}

	@Override
	public void updateCRGBoard(CoronationVO CRGBoard) throws SQLException {
		session.update("CRG-Mapper.updateCRGBoard",CRGBoard);

	}

	@Override
	public void deleteCRGBoard(String crg_code) throws SQLException {
		session.update("CRG-Mapper.deleteCRGBoard",crg_code);

	}

	@Override
	public void increaseViewCnt(String crg_code) throws SQLException {
		session.update("CRG-Mapper.increaseViewCnt",crg_code);

	}

	@Override
	public int selectCRGBoardNextSeq() throws SQLException {
		int seq_num = session.selectOne("CRG-Mapper.selectCRGBoardNextSeq");
		return seq_num;
	}

}
