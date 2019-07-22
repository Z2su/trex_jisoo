package com.trex.service;

import java.lang.reflect.Member;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.trex.controller.Criteria;
import com.trex.dto.EPViewVO;
import com.trex.dto.EmployeeVO;
import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.TroupeVO;

public interface MemberService {
	
		// 회원가입
		String regist(MemberVO member, String type)throws SQLException;
		void regist(MemberVO member)throws SQLException;
		void regist(GmemberVO gmember)throws SQLException;
		void regist(TroupeVO troupe)throws SQLException;
		void regist(MemberVO member,EmployeeVO employee)throws SQLException;

		// 회원조회
		MemberVO getMember(String mem_id)throws SQLException;
		GmemberVO getGmember(String id)throws SQLException;
		TroupeVO getTroupe(String id)throws SQLException;
		EmployeeVO getEmployee(String ep_code)throws SQLException;

		// 회원리스트
		List<MemberVO> getMemberList()throws SQLException;
		List<MemberVO> getMemberListlike(String code)throws SQLException;
		Map<String,Object> getMemberList(Criteria cri)throws SQLException;
	
		
		List<GmemberVO> getGmemberList()throws SQLException;
		Map<String,Object> getGmemberList(Criteria cri)throws SQLException;
		
		List<TroupeVO> getTroupeList()throws SQLException;
		Map<String,Object> getTroupeList(Criteria cri)throws SQLException;
		void userReg_service(MemberVO memberVO);

		void create(MemberVO member) throws Exception;
		
		void updateAuthstatus(MemberVO member) throws SQLException;

		List<EPViewVO> getEmployeeList()throws SQLException;
		Map<String,Object> getEmployeeList(Criteria cri)throws SQLException;




		
}
	
	
