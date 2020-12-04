package mat.dong.san.board.model.service;

import java.util.ArrayList;

import mat.dong.san.board.model.vo.Board;
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

	int deleteNotice(int bId);

	int noticeUpdate(Board b);

	
	// 1대1
	int oneToOneListCount();

	ArrayList<Board> oneToOneList(PageInfo pi);

	int oneToOneInsert(Board b);

	int deleteOneToOne(int bId);

	Board oneToOneDetail(int oneToOneId);

	int oneToOneUpdate(Board b);

	
	
	
	
	
}
