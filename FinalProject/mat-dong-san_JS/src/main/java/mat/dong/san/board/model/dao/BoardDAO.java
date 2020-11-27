package mat.dong.san.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.board.model.vo.Board;
import mat.dong.san.board.model.vo.PageInfo;

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

	public int deleteNotice(SqlSessionTemplate sqlSession, int bId) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.noticeDelete", bId);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.noticeUpdate", b);
	}

	
	//1대1 게시글 갯수
	public int oneToOneListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.oneToOneListCount");
	}
	// 목록조회
	public ArrayList<Board> oneToOneList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("boardMapper.oneToOneList", null, rb);
	}

	// 1대1 글 작성
	public int oneToOneInsert(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.oneToOneInsert", b);
	}

	public int deleteOneToOne(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.oneToOneDelete", bId);
	}

	public Board oneToOneDetail(SqlSessionTemplate sqlSession, int oneToOneId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.oneToOneDetail", oneToOneId);
	}

	public int updateOneToOne(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.oneToOneUpdate", b);
	}
}
