package mat.dong.san.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mat.dong.san.board.model.exception.BoardException;
import mat.dong.san.board.model.service.BoardService;
import mat.dong.san.board.model.vo.Board;
import mat.dong.san.board.model.vo.PageInfo;
import mat.dong.san.common.Pagination;

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
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
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
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
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
	public String goBoardNoticeWrite() {
		return "/notice/noticeWrite";
	}
	
	// 공지사항 작성 submit
	@RequestMapping("noticeWriteConfirm.board")
	public String NoticeWriteConfirm(@ModelAttribute Board b, Model model) {
		
		int result = bService.noticeInsert(b);
		
		if(result > 0) {
			return "redirect:noticeDetail.board";
		}else {
			throw new BoardException("게시글 동록에 실패하였습니다.");
		}
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
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
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
	public String oneToOneWriteConfirm(@ModelAttribute Board b, Model model) {
		
		int result = bService.oneToOneInsert(b);
		
		if(result > 0) {
			return "redirect:boardOneToOne.board";
		}else {
			throw new BoardException("게시글 동록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("oneToOneDelete.board")
	public String oneToOneDelete(HttpServletResponse response,
			@RequestParam(value="deleteOneToOneId", required = false) int [] bId) {
		
		
		
		int result = 0;
		for(int i =0 ; i<bId.length; i++) {
			System.out.println(bId[i]);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
