package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.trex.dto.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<NoticeVO> selectSearchNoticeList() throws SQLException {

		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectNoticeList");

		return noticeList;
	}

	@Override
	public NoticeVO selectNotice(int notice_num) throws SQLException {

		NoticeVO Notice = session.selectOne("Notice-Mapper.selectNotice", notice_num);

		return Notice;
	}

	@Override
	public int selectNoticeSeqNext() throws SQLException {
		
		int notice_num = session.selectOne("Notice-Mapper.selectNoticeSeqNext");
		
		return notice_num;
	}

	@Override
	public void increaseViewCnt(int notice_num) throws SQLException {
		
		session.update("Notice-Mapper.increaseViewCnt", notice_num);
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		
		session.update("Notice-Mapper.insertNotice", notice);
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		
		session.update("Notice-Mapper.updateNotice", notice);
	}

	@Override
	public void deleteNotice(int notice_num) throws SQLException {
		
		session.update("Notice-Mapper.deleteNotice", notice_num);
	}

	@Override
	public NoticeVO selectNoticeBynotice_num(int notice_num) throws SQLException {
		
		NoticeVO notice = (NoticeVO) session.selectOne(".selectNoticeBynotice_num", notice_num);
		
		return notice;
	}
}