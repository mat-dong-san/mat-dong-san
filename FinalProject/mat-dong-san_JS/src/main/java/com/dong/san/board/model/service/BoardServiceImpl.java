package com.dong.san.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dong.san.board.model.dao.BoardDAO;
import com.dong.san.board.model.vo.Board;
import com.dong.san.board.model.vo.PageInfo;



@Service("bService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	
	
	@Override
	public int insertFAQ(Board b) {
		return bDAO.insertFAQ(sqlSession, b );
	}


	@Override
	public int boardFAQListCount() {
		return bDAO.boardFAQListCount(sqlSession);
	}

	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return bDAO.selectList(sqlSession, pi);
	}


	@Override
	public int deleteFAQ(int bId) {
		// TODO Auto-generated method stub
		return bDAO.deleteFAQ(sqlSession, bId);
	}




	@Override
	public int updateFAQ(Board board) {
		return bDAO.updateFAQ(sqlSession, board);
	}

	// 공지사항
	@Override
	public int boardNoticeListCount() {
		// TODO Auto-generated method stub
		return bDAO.boardNoticeListCount(sqlSession);
	}


	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		return bDAO.selectNoticeList(sqlSession, pi);
	}


	@Override
	public Board noticeDetail(int noticeId) {
		// TODO Auto-generated method stub
		
		Board board = null;
		// 클릭시 조회수 + 1
		int result = bDAO.noticeClickCount(sqlSession, noticeId);
		
		if(result > 0) {
			board =  bDAO.noticeDetail(sqlSession, noticeId);
		}
		
		return board;
	}


	@Override
	public int noticeInsert(Board b) {
		// TODO Auto-generated method stub
		return bDAO.noticeInsert(sqlSession,b)	;
	}
	



	
}
