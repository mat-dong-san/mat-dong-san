package mat.dong.san.board.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import mat.dong.san.board.model.vo.Board;
import mat.dong.san.board.model.vo.BoardAttachment;
import mat.dong.san.board.model.vo.BoardComment;
import mat.dong.san.board.model.vo.BoardType;
import mat.dong.san.board.model.vo.PageInfo;

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
	Board noticebIdFind(Board b);

	int deleteNotice(int bId);

	int noticeUpdate(Board b);

	
	// 1대1
	int oneToOneListCount();

	ArrayList<Board> oneToOneList(PageInfo pi);

	int oneToOneInsert(Board b);

	int deleteOneToOne(int bId);

	Board oneToOneDetail(int oneToOneId);

	int oneToOneUpdate(Board b);

	
	//중고
	int usedListCount();

	ArrayList usedList(PageInfo pi);

	int usedWrite(Board b, List<MultipartFile> fileList, HttpServletRequest request);

	Board usedDetail(int usedId);

	ArrayList<BoardType> selectBType();

	int usedDelete(int bId);

	int usedinsertComment(BoardComment bc);

	ArrayList<BoardComment> commentListPrint(int bId);

	int usedCommentDelete(BoardComment bc);

	ArrayList<BoardAttachment> usedAttachDetail(int usedId);

	int oneToOneInsertComment(BoardComment bc);

	ArrayList<BoardComment> oneToOneCommentList(int bId);

	int oneToOneCommentDelete(BoardComment bc);

	ArrayList<BoardAttachment> usedAttachDetail();

	
	
	
	int noticeDetailDelete(Board b);

	int oneToOneDetailDelete(Board b);




	
	
	
	
	
}
