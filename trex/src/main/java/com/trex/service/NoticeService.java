package com.trex.service;

import java.sql.SQLException;
import java.util.List;

import com.trex.dto.NoticeVO;

public interface NoticeService {

	List<NoticeVO> getNoticeList() throws Exception;	
	
	NoticeVO getNoticeForModify(int notice_num) throws SQLException;
	NoticeVO readNotice(int notice_num) throws SQLException;
	NoticeVO readByNoticeNum(int notice_num) throws SQLException;

	void regist(NoticeVO notice)throws SQLException;
	void modify(NoticeVO notice)throws SQLException;
	void remove(int notice_num)throws SQLException;
}