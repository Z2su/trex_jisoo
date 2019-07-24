package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dao.NoticeDAO;
import com.trex.dto.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO NoticeDAO;

	public void setNoticeDAO(NoticeDAO NoticeDAO) {
		this.NoticeDAO = NoticeDAO;
	}

	@Override
	public List<NoticeVO> getNoticeList() throws Exception {

		List<NoticeVO> NoticeList = NoticeDAO.selectSearchNoticeList();
		return NoticeList;
	}

	@Override
	public NoticeVO readNotice(int notice_num) throws SQLException {

		NoticeVO Notice = NoticeDAO.selectNotice(notice_num);
		NoticeDAO.increaseViewCnt(notice_num);
		return Notice;
	}

	@Override
	public NoticeVO getNoticeForModify(int notice_num) throws SQLException {

		NoticeVO Notice = NoticeDAO.selectNotice(notice_num);

		return Notice;
	}

	@Override
	public void regist(NoticeVO notice) throws SQLException {

		int notice_num = NoticeDAO.selectNoticeSeqNext();
		String code = "notice" + String.format("%04d", notice_num);
		notice.setNotice_code(code);
		notice.setNotice_num(notice_num);
		NoticeDAO.insertNotice(notice);
	}

	@Override
	public void modify(NoticeVO notice) throws SQLException {

		NoticeDAO.updateNotice(notice);
	}

	@Override
	public void remove(int notice_num) throws SQLException {

		NoticeDAO.deleteNotice(notice_num);
	}

	@Override
	public NoticeVO readByNoticeNum(int notice_num) throws SQLException {
		
		NoticeVO notice = NoticeDAO.selectNoticeBynotice_num(notice_num);
		
		return notice;
	}
}