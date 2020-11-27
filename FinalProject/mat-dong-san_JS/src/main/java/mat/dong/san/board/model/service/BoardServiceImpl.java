package mat.dong.san.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.board.model.dao.BoardDAO;
import mat.dong.san.board.model.vo.Board;
import mat.dong.san.board.model.vo.PageInfo;



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

	// 공지사항 목록
	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		return bDAO.selectNoticeList(sqlSession, pi);
	}

	// 공지사항 디테일 뷰
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

	// 공지사항 쓰기
	@Override
	public int noticeInsert(Board b) {
		// TODO Auto-generated method stub
		return bDAO.noticeInsert(sqlSession,b)	;
	}

	// 목록에서 선택 삭제
	@Override
	public int deleteNotice(int bId) {
		// TODO Auto-generated method stub
		return bDAO.deleteNotice(sqlSession, bId);
	}

	// 공지사항 수정
	@Override
	public int noticeUpdate(Board b) {
		// TODO Auto-generated method stub
		return bDAO.updateNotice(sqlSession, b);
	}


	// 1대1 문의
	@Override
	public int oneToOneListCount() {

		return bDAO.oneToOneListCount(sqlSession);
	}


	@Override
	public ArrayList<Board> oneToOneList(PageInfo pi) {
		// TODO Auto-generated method stub
		return bDAO.oneToOneList(sqlSession, pi);
	}


	@Override
	public int oneToOneInsert(Board b) {
		// TODO Auto-generated method stub
		return bDAO.oneToOneInsert(sqlSession,b)	;
	}


	@Override
	public int deleteOneToOne(int bId) {
		// TODO Auto-generated method stub
		return bDAO.deleteOneToOne(sqlSession, bId);
	}

	// 1대1 디테일
	@Override
	public Board oneToOneDetail(int oneToOneId) {
		// TODO Auto-generated method stub
		return bDAO.oneToOneDetail(sqlSession, oneToOneId);
	}


	@Override
	public int oneToOneUpdate(Board b) {
		// TODO Auto-generated method stub
		return bDAO.updateOneToOne(sqlSession, b);
	}


	
	
	



	
}
