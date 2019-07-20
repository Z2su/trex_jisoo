package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.trex.controller.Criteria;
import com.trex.dto.EPViewVO;
import com.trex.dto.EmployeeVO;
import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.TroupeVO;

@Repository
public interface MemberDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	
	//MemberVO 리스트
		List<MemberVO> selectMemberList()throws SQLException;
		List<MemberVO> selectMemberListlike(String code)throws SQLException;
		List<MemberVO> selectMemberList(Criteria cri)throws SQLException;
	
	//GmemberVO 리스트
		List<GmemberVO> selectGmemberList()throws SQLException;
		List<GmemberVO> selectGmemberList(Criteria cri)throws SQLException;	
	
	//TroupeVO 리스트
		List<TroupeVO> selectTroupeList()throws SQLException;
		List<TroupeVO> selectTroupeList(Criteria cri)throws SQLException;
	
		//EmployeeVO 리스트
		List<EPViewVO> selectEmployeeList()throws SQLException;
		List<EPViewVO> selectEmployeeList(Criteria cri)throws SQLException;
		
	
	 
		
	void insertMember(MemberVO member)throws SQLException;
	void insertGmember(GmemberVO gmember)throws SQLException;
	void insertTroupe(TroupeVO Troupe)throws SQLException;
	void insertEmployee(EmployeeVO employee)throws SQLException;
	
	
	void updateMember(MemberVO member)throws SQLException;
	void updateGmember(GmemberVO gmember)throws SQLException;
	void updateTroupe(TroupeVO troupe)throws SQLException;
	void updateEmployee(EmployeeVO employee)throws SQLException;
	
	int selectMemberNextSeq()throws SQLException;
	
	MemberVO selectMemberById(String mem_id)throws SQLException;

	
	

}
