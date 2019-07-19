package com.trex.service;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.trex.controller.Criteria;
import com.trex.dao.MemberDAO;
import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.TroupeVO;

public class MemberServiceImpl implements MemberService {

	// MemberDAO 
		private MemberDAO memberDAO;
		public void setMemberDAO(MemberDAO memberDAO) {
			this.memberDAO=memberDAO;
		}

		
	
	@Override
	public String regist(MemberVO member, String type) throws SQLException {
		
		int num = memberDAO.selectMemberNextSeq();
		
		String code = type.toUpperCase()+String.format("%04d", num);
		member.setMem_code(code);
		memberDAO.insertMember(member);
		return code;
		
	}

	@Override
	public void regist(GmemberVO gmember) throws SQLException {
		memberDAO.insertGmember(gmember);
		
	}

	@Override
	public void regist(TroupeVO troupe) throws SQLException {
		memberDAO.insertTroupe(troupe);
		
	}

	@Override
	public MemberVO getMember(String mem_id) throws SQLException {
		return memberDAO.selectMemberById(mem_id);
	}

	@Override
	public GmemberVO getGmember(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TroupeVO getTroupe(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getMemberList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GmemberVO> getGmemberList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getGmemberList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TroupeVO> getTroupeList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getTroupeList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void userReg_service(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
	}



	



	
	

}
