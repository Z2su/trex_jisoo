package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.dto.PerformGuidBoardVO;

public class PerformGuidBoardDAOImpl implements PerformGuidBoardDAO {

	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<PerformGuidBoardVO> selectPFGBoardList() throws SQLException {
		
		List<PerformGuidBoardVO> PFGBoardList = session.selectList("PFGBoard-Mapper.selectPFGBoardList",null);
		
		return PFGBoardList;
	}

	@Override
	public PerformGuidBoardVO selectPFGBoard(String pfg_code) throws SQLException {
		
		PerformGuidBoardVO PFGBoard = session.selectOne("PFGBoard-Mapper.selectPFGBoard",pfg_code);
		
		return PFGBoard;
	}

	@Override
	public void insertPFGBoard(PerformGuidBoardVO PFGBoard) throws SQLException {
		session.update("PFGBoard-Mapper.insertPFGBoard",PFGBoard);

	}

	@Override
	public void updatePFGBoard(PerformGuidBoardVO PFGBoard) throws SQLException {
		session.update("PFGBoard-Mapper.updatePFGBoard",PFGBoard);

	}

	@Override
	public void deletePFGBoard(String pfg_code) throws SQLException {
		session.update("PFGBoard-Mapper.deletePFGBoard",pfg_code);

	}

	@Override
	public void increaseViewCnt(String pfg_code) throws SQLException {
		session.update("PFGBoard-Mapper.increaseViewCnt",pfg_code);

	}

	@Override
	public int selectPFGBoardNextSeq() throws SQLException {
		int seq_num = session.selectOne("PFGBoard-Mapper.selectPFGBoardNextSeq");
		return seq_num;
	}
	/*@Override
	public PerformVO selectPF(String pf_code) throws SQLException {
		PerformVO PF = session.selectOne("PFGBoard-Mapper.selectPF",pf_code);
		
		return PF;
	}
	@Override
	public PerformScheduleVO selectPFSH(String pf_code) throws SQLException {
		PerformScheduleVO PFSH = session.selectOne("PFGBoard-Mapper.selectPFSH",pf_code);
		
		return PFSH;
	}*/
	@Override
	public List<PerformGuidBoardVO> selectPFGBoardListByPFcode(String pf_code) throws SQLException {
		List<PerformGuidBoardVO> PFGBoardList = session.selectList("PFGBoard-Mapper.selectPFGBoardListByPFcode",pf_code);
		
		return PFGBoardList;
		
	}
	@Override
	public PerformGuidBoardVO selectPFGBoardByPFSH(String pfsh_code) throws SQLException {
		PerformGuidBoardVO PFGBoard = session.selectOne("PFGBoard-Mapper.selectPFGBoardByPFSH",pfsh_code);
		
		return PFGBoard;
	}

}
