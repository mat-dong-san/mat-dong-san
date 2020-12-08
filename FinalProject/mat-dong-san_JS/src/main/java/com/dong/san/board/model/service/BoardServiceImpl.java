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


	



	
}
