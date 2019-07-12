package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.AttachVO;

public class AttachDAOImpl implements AttachDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session=session;
	}
	
	private static final String NAMESPACE="AttachMapper";
	
	@Override
	public List<AttachVO> selectAttachesByAttachCode(String attach_code) throws SQLException {
		List<AttachVO> attachList = 
				session.selectList(NAMESPACE+".selectAttachesByAttachCode",attach_code);
		
		return attachList;
	}

	@Override
	public AttachVO selectAttachByPostcode(String post_code) throws SQLException {
		AttachVO attach = 
		session.selectOne(NAMESPACE+".",post_code);
		return attach;
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		session.update(NAMESPACE+".insertAttach",attach);

	}

	@Override
	public void deleteAttach(String attach_code) throws SQLException {
		session.update(NAMESPACE+".deleteAttach",attach_code);

	}

	@Override
	public void deleteAllAttach(String attach_code) throws SQLException {
		session.update(NAMESPACE+".deleteAllAttach",attach_code);

	}

}
