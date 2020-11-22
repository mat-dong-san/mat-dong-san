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

	public int deleteFAQ(SqlSessionTemplate sqlSession, int bId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.deleteFAQ", bId);
	}


	public int updateFAQ(SqlSessionTemplate sqlSession, Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateFAQ", board);
	}

	public int boardNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.boardNoticeListCount");
	}

	public ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("boardMapper.boardNoticeList", null, rb);
	}

	public Board noticeDetail(SqlSessionTemplate sqlSession, int noticeId) {
		return sqlSession.selectOne("boardMapper.noticeDetail", noticeId);
	}

	public int noticeClickCount(SqlSessionTemplate sqlSession, int noticeId) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.noticeClickCount", noticeId);
	}

	public int noticeInsert(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.noticeInsert", b);
	}
}
