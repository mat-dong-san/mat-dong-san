package com.dong.san.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dong.san.board.model.vo.Board;
import com.dong.san.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

	public int insertFAQ(SqlSessionTemplate sqlSession, Board b ) {
		return sqlSession.insert("boardMapper.insertFAQ", b);
	}

	// FAQ ListCount
	public int boardFAQListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.boardFAQListCount");
	}
	
	// FAQ select
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("boardMapper.boardFAQList", null, rb);
	}

}
