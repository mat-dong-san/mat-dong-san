package mat.dong.san.board.model.dao;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import mat.dong.san.board.model.vo.Board;
import mat.dong.san.board.model.vo.BoardAttachment;
import mat.dong.san.board.model.vo.BoardComment;
import mat.dong.san.board.model.vo.BoardType;
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
	
	// 공지사항 bId 찾기
	public Board noticebIdFind(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.noticebIdFind", b);
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
	
	
	
	//중고장터
	public int usedListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.usedListCount");
	}
	// 중고나라 목록
	public ArrayList usedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.usedList", null, rb);
	}
	public int usedWrite(SqlSessionTemplate sqlSession, Board b, List<MultipartFile> fileList, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("/")	;
		String path = root + "resources/chdir";
		System.out.println(path);
		File f = new File(path);
		
		if(!f.exists()) {
			f.mkdirs();
		}
		BoardAttachment ba = new BoardAttachment();
		int result  = 0;
		int result1 = sqlSession.insert("boardMapper.usedWrite", b);
		System.out.println("dao : " + b);
		if(result1 > 0 ) {
			for (MultipartFile mf : fileList) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				if(originFileName == "" ) {
					continue;
				} 
				long fileSize = mf.getSize(); // 파일 사이즈
				
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);
				
				String safeFile = System.currentTimeMillis() + originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
				System.out.println(safeFile);
				String renamePath = f + "/" + safeFile;
				
				try {
					mf.transferTo(new File(renamePath));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				if(safeFile != null) {
					ba.setBaOrName(originFileName);
					ba.setBaChName(safeFile);
				}
				int result2 = sqlSession.insert("boardMapper.usedWriteAttachment", ba);
			}
			result = 1;
		}
		
		return result;
	}

	public Board usedDetail(SqlSessionTemplate sqlSession, int usedId) {
		return sqlSession.selectOne("boardMapper.usedDetail", usedId);
	}

	public ArrayList<BoardType> selectBType(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectBType");
	}

	public int usedDelete(SqlSessionTemplate sqlSession, int bId) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.usedDelete", bId);
	}

	public int usedinsertComment(SqlSessionTemplate sqlSession, BoardComment bc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.usedinsertComment", bc);
	}

	public ArrayList<BoardComment> commentListPrint(SqlSessionTemplate sqlSession, int bId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.commentListPrint", bId);
	}

	public int usedCommentDelete(SqlSessionTemplate sqlSession, BoardComment bc) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.usedCommentDelete", bc);
	}

	public ArrayList<BoardAttachment> usedAttachDetail(SqlSessionTemplate sqlSession, int usedId) {
		// TODO Auto-generated method stub
		return   (ArrayList)sqlSession.selectList("boardMapper.usedAttachDetail", usedId);
	}

	public int oneToOneInsertComment(SqlSessionTemplate sqlSession, BoardComment bc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.oneToOneInsertComment", bc);
	}

	public ArrayList<BoardComment> oneToOneCommentList(SqlSessionTemplate sqlSession, int bId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.oneToOneCommentList", bId);
	}

	public int oneToOneCommentDelete(SqlSessionTemplate sqlSession, BoardComment bc) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.oneToOneCommentDelete", bc);
	}

	public ArrayList<BoardAttachment> usedAttachDetail(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.usedAttachDetail");
	}

	
	
	
	
	
	public int noticeDetailDelete(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.noticeDetailDelete", b);
	}

	public int oneToOneDetailDelete(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.oneToOneDetailDelete", b);
	}
	



}
