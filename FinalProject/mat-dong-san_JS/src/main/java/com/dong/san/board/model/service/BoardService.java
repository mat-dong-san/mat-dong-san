package com.dong.san.board.model.service;

import java.util.ArrayList;

import com.dong.san.board.model.vo.Board;
import com.dong.san.board.model.vo.PageInfo;

public interface BoardService {
	//FAQ
	int insertFAQ(Board b);

	int boardFAQListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int deleteFAQ(int bId);

	int updateFAQ(Board board);
	
	
	// 공지사항
	int boardNoticeListCount();

	ArrayList<Board> selectNoticeList(PageInfo pi);

	Board noticeDetail(int noticeId);

	int noticeInsert(Board b);
	
}
