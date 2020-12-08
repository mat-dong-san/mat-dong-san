package mat.dong.san.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import mat.dong.san.board.model.exception.BoardException;
import mat.dong.san.board.model.service.BoardService;
import mat.dong.san.board.model.vo.Board;
import mat.dong.san.board.model.vo.BoardAttachment;
import mat.dong.san.board.model.vo.BoardComment;
import mat.dong.san.board.model.vo.BoardType;
import mat.dong.san.board.model.vo.PageInfo;
import mat.dong.san.common.Pagination;
import mat.dong.san.member.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("boardFAQ.board")
	public ModelAndView goFAQPage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.boardFAQListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, "");
		
		ArrayList<Board> list = bService.selectList(pi);

		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/FAQ/boardFAQ");
		}else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	// FAQ 모달창 Insert
	@RequestMapping("InsertFAQ.board")
	public String insertFAQ(HttpServletResponse response, @RequestParam("rQuestion") String rQuestion, @RequestParam("rAnswer") String rAnswer) throws IOException {

		Board b = new Board(rQuestion, rAnswer);
		
		
		int result = bService.insertFAQ(b);
		if(result > 0) {
			return "redirect:boardFAQ.board";
		} else {
			return "redirect:boardFAQ.board";
		}
		
	}
	// FAQ 선택 삭제
	@RequestMapping("FAQDelete.board")
	public String deleteFAQ(HttpServletResponse response, @RequestParam("FAQDeletebId") int bId) {

		int result = bService.deleteFAQ(bId);
		
		if(result > 0) {
			return "redirect:boardFAQ.board";
		} else {
			return "redirect:boardFAQ.board";
		}
	}
	@RequestMapping("FAQUpdate.board")
	@ResponseBody
	public String updateFAQ(HttpServletResponse response, @RequestParam("bId") int bId, @RequestParam("bTitle") String bTitle,@RequestParam("bContent") String bContent  ) {
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject j = new JSONObject();
		Board board = new Board(bId, bTitle, bContent);
		int result = bService.updateFAQ(board);
		j.put("result", result);
		if(result > 0) {
			return j.toJSONString();
		} else {
			return "redirect:boardFAQ.board";
		}
			
	}

	///////////////////////////////////////////

	
	
	// 공지사항
	@RequestMapping("boardNoticeList.board")
	public ModelAndView goBoardNoticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		int listCount = bService.boardNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, "");
		ArrayList<Board> list = bService.selectNoticeList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/notice/noticeList");
		}else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		
		return mv;
	}
	
	// 공지사항 디테일
	@RequestMapping("noticeDetail.board")
	public ModelAndView goNoticeDetail(@RequestParam("bId") int noticeId, @RequestParam("page") int page, ModelAndView mv) {
		
		Board board = bService.noticeDetail(noticeId);
		
		if(board != null) {
			mv.addObject("notice", board)
			.addObject("page", page)
			.setViewName("/notice/noticeDetail");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다."); 
		}
		
		return mv;
	}
	
	
	// 공지사항 작성하기 페이지 이동
	@RequestMapping("boardNoticeWrite.board")
//	public ModelAndView goNoticeWrite(@RequestParam(value="page", required=false) int page, ModelAndView mv) {
		public String goNoticeWrite() {
		return "/notice/noticeWrite";
		
//		mv.addObject("page", page)
//		.setViewName("/notice/noticeWrite");
		
//		return mv;
		
	}
	
	// 공지사항 작성 submit
	@RequestMapping("noticeWriteConfirm.board")
//	public ModelAndView noticeWriteConfirm(@ModelAttribute Board b, ModelAndView mv ,   @RequestParam(value="page", required=false) int page ) {
	public String noticeWriteConfirm(@ModelAttribute Board b, Model model) {
		int result = bService.noticeInsert(b);
		
		if(result > 0) {
//			Board board = bService.noticebIdFind(b);
//			System.out.println(">>>"+board);
//			mv.addObject("page", page)
//			.setViewName("redirect:noticeDetail.board?bId=" + b.getbId());
			return "redirect:boardNoticeList.board";
			
		}else {
			throw new BoardException("게시글 동록에 실패하였습니다.");
		}
		
//		return mv;
	}
	
	// Notice 선택 삭제
	@RequestMapping("boardNoticeDelete.board")
	public String noticeDelete(HttpServletResponse response, 
			@RequestParam(value="deleteNoticebId", required = false) int [] bId) {
		int result = 0;
		for(int i= 0; i< bId.length; i++) {
			result = bService.deleteNotice(bId[i]);
		}
		
		
		
		
		if(result > 0) {
			return "redirect:boardNoticeList.board";
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}
	}
	
	
	@RequestMapping("goNoticeUpdate.board")	
	public ModelAndView goBoardNoticeUpdate(@RequestParam("bId") int bId, @RequestParam("page") int page, ModelAndView mv) {

		
		
		//		 Board board = bService.selectBoard(bId);
		Board board = bService.noticeDetail(bId);
		
		mv.addObject("notice", board)
		  .addObject("page", page)
		  .setViewName("/notice/noticeUpdate");
		 
		 return mv;
	}
	
	@RequestMapping("noticeUpdateConfirm.board")
	public ModelAndView NoticeUpdateConfirm(@ModelAttribute Board b,@RequestParam("page") int page, ModelAndView mv) {
		
		
		int result = bService.noticeUpdate(b);
		
		if(result > 0) {
			mv.addObject("page", page)
			.setViewName("redirect:noticeDetail.board?bId=" + b.getbId());
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");	
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 1대1문의
//	@RequestMapping("boardOneToOne.board")
//	public String goBoardOneToOnePage() {
//		
//		return "/oneToOne/oneToOneList";
//	}
	
	
	// 1대1 목록 
	@RequestMapping("boardOneToOne.board")
	public ModelAndView goBoardOneToOnePage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		int listCount = bService.oneToOneListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, "");
		ArrayList<Board> list = bService.oneToOneList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/oneToOne/oneToOneList");
		}else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	// 작성폼 이동
	@RequestMapping("goOneToOneWrite.board")
	public String goBoardOneToOneWrite() {
		return "/oneToOne/oneToOneWrite";
	}
	// 1대1 문의글 작성하기
	@RequestMapping("oneToOneWriteConfirm.board")
//	public ModelAndView oneToOneWriteConfirm(@ModelAttribute Board b,@RequestParam("page") int page, ModelAndView mv) {
	public String oneToOneWriteConfirm(@ModelAttribute Board b, Model model) {	
		
		
		int result = bService.oneToOneInsert(b);
		
		if(result > 0) {
//			mv.addObject("page" , page)
//			.setViewName("redirect:oneToOneDetail.board?bId" + b.getbId());
			return "redirect:boardOneToOne.board";
		}else {
			throw new BoardException("게시글 동록에 실패하였습니다.");
		}
		
//		return mv;
	}
	
	@RequestMapping("oneToOneDelete.board")
	public String oneToOneDelete(HttpServletResponse response,
			@RequestParam(value="deleteOneToOneId", required = false) int [] bId) {
		
		
		
		int result = 0;
		for(int i =0 ; i<bId.length; i++) {
			result = bService.deleteOneToOne(bId[i]);
		
		}
		if(result > 0) {
			return "redirect:boardOneToOne.board";
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}
			
	}
	
	@RequestMapping("oneToOneDetail.board")
	public ModelAndView goOnetoOneDetail(@RequestParam("bId") int oneToOneId, @RequestParam("page") int page, ModelAndView mv) {
		
		Board board = bService.oneToOneDetail(oneToOneId);
		
		if(board != null) {
			mv.addObject("oto", board)
			.addObject("page", page)
			.setViewName("/oneToOne/oneToOneDetail");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다."); 
		}
		
		return mv;
	}
	
	//1대1 업데이트폼으로
	@RequestMapping("goOneToOneUpdate.board")
	public ModelAndView goOneToOneUpdate(@RequestParam("oTobId") int bId, @RequestParam("page") int page, ModelAndView mv) {
		//		 Board board = bService.selectBoard(bId);
		Board board = bService.oneToOneDetail(bId);
		
		mv.addObject("oTo", board)
		  .addObject("page", page)
		  .setViewName("/oneToOne/oneToOneUpdate");
		 
		 return mv;
	}
	// 1대 1 업데이트 
	@RequestMapping("oneToOneUpdateConfirm.board")
	public ModelAndView oneToOneUpdateConfirm(@ModelAttribute Board b, @RequestParam("page") int page, ModelAndView mv) {
		
		
		int result = bService.oneToOneUpdate(b);
		
		if(result > 0) {
			mv.addObject("page", page)
			.setViewName("redirect:oneToOneDetail.board?bId=" + b.getbId());
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");	
		}
		return mv;
	}
	
	
	// 중고장터
	@RequestMapping("used.board")
	public ModelAndView goUsedPage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.usedListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, "used");
		ArrayList list = bService.usedList(pi);
		
		ArrayList<BoardAttachment> ba = bService.usedAttachDetail();
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/used/usedList");
		}else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 중고장터 insert로 
	
	// 작성폼 이동
	@RequestMapping("goUsedWrite.board")
	public ModelAndView goUsedWrite(ModelAndView mv) {
		ArrayList<BoardType> btypeList = bService.selectBType();
		mv.addObject("usedType",btypeList);
		mv.setViewName("/used/usedWrite");
		return mv;
	}



	@RequestMapping("usedInsert.board")	
	public String boardInsert(@ModelAttribute Board b, MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {
		List<MultipartFile> fileList = mtfRequest.getFiles("uploadFile");
		
		int result = bService.usedWrite(b, fileList, request);

	    return "redirect:used.board";
	}
	
	
	@RequestMapping("usedDetail.board")
	public ModelAndView goUsedDetail(@RequestParam("bId") int usedId, HttpSession session, @RequestParam("page") int page, ModelAndView mv) {
//		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Board b = bService.usedDetail(usedId );
		ArrayList<BoardAttachment> ba = bService.usedAttachDetail(usedId);
		System.out.println("b의값 : "+b);
		if(b != null) {
			mv.addObject("ba", ba);
			mv.addObject("used", b)
			.addObject("page", page)
			.setViewName("/used/usedDetail");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다."); 
		}
		
		return mv;
	}
	
	@RequestMapping("goUsedUpdate.board")
	public ModelAndView goUsedUpdate(@RequestParam("bId") int bId, @RequestParam("page") int page, ModelAndView mv) {
		
		Board board = bService.usedDetail(bId);
		ArrayList<BoardType> btypeList = bService.selectBType();
		mv.addObject("usedType",btypeList);
		mv.addObject("used", board)
		  .addObject("page", page)
		  .setViewName("/used/usedUpdate");
		 
		 return mv;
		
	}
	
	

	
	@RequestMapping("usedDelete.board")
	public String usedDelete(HttpServletResponse response,
			@RequestParam(value="usedbId", required = false) int bId) {
		int result = bService.usedDelete(bId);
		
		if(result > 0) {
			return "redirect:used.board";
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}
			
	}
	
	@RequestMapping("usedinsertComment.board")
	@ResponseBody
	public String usedinsertComment(BoardComment bc, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String usId = loginUser.getUs_id();
		System.out.println("댓글 삽입 : " +usId);
		System.out.println("bc의값 : " + bc);
		bc.setUsId(usId);
		
		int result = bService.usedinsertComment(bc);

		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("commentListPrint.board")
	public void commentListPrint(int bId, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<BoardComment> list = bService.commentListPrint(bId);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("usedCommentDelete.board")
	@ResponseBody
	public String usedCommentDelete(BoardComment bc) {
		int result = bService.usedCommentDelete(bc);

		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 삭제 실패하였습니다.");
		}
	}
	
	
	// 1대1 댓글 넣기
	@RequestMapping("oneToOneInsertComment.board")
	@ResponseBody
	public String oneToOneInsertComment(BoardComment bc, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String usId = loginUser.getUs_id();
		System.out.println("댓글 삽입 : " +usId);
		System.out.println("bc의값 : " + bc);
		bc.setUsId(usId);
		
		int result = bService.oneToOneInsertComment(bc);

		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("oneToOneCommentList.board")
	public void oneToOneCommentList(int bId, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<BoardComment> list = bService.oneToOneCommentList(bId);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("oneToOneCommentDelete.board")
	@ResponseBody
	public String oneToOneCommentDelete(BoardComment bc) {
		int result = bService.oneToOneCommentDelete(bc);

		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 삭제 실패하였습니다.");
		}
	}
	
	
	
	@RequestMapping("noticeDelete.board")
	public ModelAndView noticeDetailDelete(@ModelAttribute Board b, @RequestParam("page") int page, ModelAndView mv) {
		System.out.println(b);
		
		int result = bService.noticeDetailDelete(b);
		
		if(result > 0) {
			mv.addObject("page", page)
			.setViewName("redirect:boardNoticeList.board");
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");	
		}
		return mv;
	}
	
	@RequestMapping("oneToOneDetailDelete.board")
	public ModelAndView oneToOneDetailDelete(@ModelAttribute Board b, @RequestParam("page") int page, ModelAndView mv) {
		System.out.println(b);
		
		int result = bService.oneToOneDetailDelete(b);
		
		if(result > 0) {
			mv.addObject("page", page)
			.setViewName("redirect:boardOneToOne.board");
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");	
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
