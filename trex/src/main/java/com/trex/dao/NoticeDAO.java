package com.trex.dao;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.NoticeVO;

public interface NoticeDAO {

	List<NoticeVO> selectSearchNoticeList() throws SQLException;
	NoticeVO selectNotice(int notice_num) throws SQLException;
	
	NoticeVO selectNoticeBynotice_num(int notice_num) throws SQLException;
	
	int selectNoticeSeqNext() throws SQLException;
	
	void increaseViewCnt(int notice_num) throws SQLException;	
	
	void insertNotice(NoticeVO notice) throws SQLException;
	void updateNotice(NoticeVO notice) throws SQLException;
	void deleteNotice(int notice_num) throws SQLException;
	
}
