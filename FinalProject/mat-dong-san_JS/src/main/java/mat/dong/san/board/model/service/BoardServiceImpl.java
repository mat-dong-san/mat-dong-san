package mat.dong.san.board.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mat.dong.san.board.model.dao.BoardDAO;
import mat.dong.san.board.model.vo.Board;
import mat.dong.san.board.model.vo.BoardAttachment;
import mat.dong.san.board.model.vo.BoardComment;
import mat.dong.san.board.model.vo.BoardType;
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
	
	// 공지사항 BID를 알아오는 역할
		@Override
		public Board noticebIdFind(Board b) {

			return bDAO.noticebIdFind(sqlSession, b);
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
		return bDAO.oneToOneList(sqlSession, pi);
	}


	@Override
	public int oneToOneInsert(Board b) {
		return bDAO.oneToOneInsert(sqlSession,b);
	}


	@Override
	public int deleteOneToOne(int bId) {
		return bDAO.deleteOneToOne(sqlSession, bId);
	}

	// 1대1 디테일
	@Override
	public Board oneToOneDetail(int oneToOneId) {
		return bDAO.oneToOneDetail(sqlSession, oneToOneId);
	}


	@Override
	public int oneToOneUpdate(Board b) {
		return bDAO.updateOneToOne(sqlSession, b);
	}

	
	
	// 중고장터 
	// 리스트 개수 
	@Override
	public int usedListCount() {
		return bDAO.usedListCount(sqlSession);
	}

	@Override
	public ArrayList usedList(PageInfo pi) {
		return bDAO.usedList(sqlSession, pi);
	}


	@Override
	public int usedWrite(Board b, List<MultipartFile> fileList, HttpServletRequest request) {
		return bDAO.usedWrite(sqlSession, b, fileList, request);
	}


	@Override
	public Board usedDetail(int usedId) {
		return bDAO.usedDetail(sqlSession, usedId);
	}


	@Override
	public ArrayList<BoardType> selectBType() {
		return bDAO.selectBType(sqlSession);
	}


	@Override
	public int usedDelete(int bId) {
		return bDAO.usedDelete(sqlSession, bId);
	}


	@Override
	public int usedinsertComment(BoardComment bc) {
		return bDAO.usedinsertComment(sqlSession, bc);
	}


	@Override
	public ArrayList<BoardComment> commentListPrint(int bId) {
		return bDAO.commentListPrint(sqlSession, bId);
	}


	@Override
	public int usedCommentDelete(BoardComment bc) {
		return bDAO.usedCommentDelete(sqlSession, bc);
	}


	@Override
	public ArrayList<BoardAttachment> usedAttachDetail(int usedId) {
		return bDAO.usedAttachDetail(sqlSession, usedId);
	}


	@Override
	public int oneToOneInsertComment(BoardComment bc) {
		return bDAO.oneToOneInsertComment(sqlSession, bc);
	}


	@Override
	public ArrayList<BoardComment> oneToOneCommentList(int bId) {
		return bDAO.oneToOneCommentList(sqlSession, bId);
	}


	@Override
	public int oneToOneCommentDelete(BoardComment bc) {
		// TODO Auto-generated method stub
		return bDAO.oneToOneCommentDelete(sqlSession, bc);
	}


	@Override
	public ArrayList<BoardAttachment> usedAttachDetail() {
		// TODO Auto-generated method stub
		return bDAO.usedAttachDetail(sqlSession);
	}


	@Override
	public int noticeDetailDelete(Board b) {
		// TODO Auto-generated method stub
		return bDAO.noticeDetailDelete(sqlSession, b);
	}


	@Override
	public int oneToOneDetailDelete(Board b) {
		// TODO Auto-generated method stub
		return bDAO.oneToOneDetailDelete(sqlSession, b);
	}












	

	
	
	



	
}
