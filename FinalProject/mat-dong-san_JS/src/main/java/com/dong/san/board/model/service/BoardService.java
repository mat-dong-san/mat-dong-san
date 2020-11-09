package com.dong.san.board.model.service;

import java.util.ArrayList;

import com.dong.san.board.model.vo.Board;
import com.dong.san.board.model.vo.PageInfo;

public interface BoardService {

	int insertFAQ(Board b);

	int boardFAQListCount();

	ArrayList<Board> selectList(PageInfo pi);

	
}
