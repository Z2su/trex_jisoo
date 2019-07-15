package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trex.controller.Criteria;
import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.TroupeVO;

public class MemberDAOImpl  implements MemberDAO{
	
	private SqlSession session;
	
	//@Autowired
		public void setSession(SqlSession session) {
			this.session=session;
		} 

	@Override
	public List<MemberVO> selectMemberList() throws SQLException {
		List<MemberVO> memberList=
				session.selectList("Member-Mapper.selectMemberList",null);
		return memberList;
	}

	@Override
	public List<MemberVO> selectMemberList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<MemberVO> memberList = null;
		
		memberList=session.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);
		return memberList;
	}

	@Override
	public List<GmemberVO> selectGmemberList() throws SQLException {
		List<GmemberVO> gmemberList=
				session.selectList("Member-Mapper.selectMemberList",null);
		return selectGmemberList();
	}
	

	@Override
	public List<GmemberVO> selectGmemberList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<GmemberVO> gmemberList = null;
		
		gmemberList=session.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);
		return gmemberList;
	}


	@Override
	public List<TroupeVO> selectTroupeList() throws SQLException {
		List<TroupeVO> TroupeList=
				session.selectList("Member-Mapper.selectMemberList",null);
		return selectTroupeList();
	}

	@Override
	public List<TroupeVO> selectTroupeList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<TroupeVO> TroupeList = null;
		
		TroupeList=session.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);
		return TroupeList;
	}


	@Override
	public void insertMember(MemberVO member) throws SQLException {
		session.update("Member-Mapper.insertMember",member);
		
	}

	@Override
	public void insertGmember(GmemberVO gmember) throws SQLException {
		session.update("Member-Mapper.insertGmember",gmember);
		
	}

	@Override
	public void insertTroupe(TroupeVO troupe) throws SQLException {
		session.update("Member-Mapper.insertTroupe",troupe);
		
	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		session.update("Member-Mapper.updateMember",member);
		
	}

	@Override
	public void updateGmember(GmemberVO gmember) throws SQLException {
		session.update("Member-Mapper.updateMember",gmember);
		
	}

	@Override
	public void updateTroupe(TroupeVO troupe) throws SQLException {
		session.update("Member-Mapper.updateMember",troupe);
		
	}

	
	

	@Override
	public int selectMemberNextSeq() throws SQLException {
		int seq_num = session.selectOne("Member-Mapper.selectMemberNextSeq");
		return seq_num;
	}

	@Override
	public MemberVO selectMemberById(String mem_id) throws SQLException {
		MemberVO member = session.selectOne("Member-Mapper.selectMemberById", mem_id);
		return member;
	}
	@Autowired
	SqlSession sqlsession = null;
	
	



	
	
	
	
	

}
