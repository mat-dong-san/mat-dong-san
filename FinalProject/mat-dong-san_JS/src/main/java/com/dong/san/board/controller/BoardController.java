package com.dong.san.board.controller;

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

import com.dong.san.board.model.exception.BoardException;
import com.dong.san.board.model.service.BoardService;
import com.dong.san.board.model.vo.Board;
import com.dong.san.board.model.vo.PageInfo;
import com.dong.san.common.Pagination;

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
//		System.out.println("listCount : " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
//		System.out.println(list);
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
		
		
//		if(result > 0 ) {
//			return " 
//		}else {
//			throw new BoardException("게시글 등록에 실패하였습니다.");
//		}
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
		System.out.println("b의값이 넘어왔나? : " + bId);
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
//		System.out.println("b의값이 넘어왔나? : " + bId);
//		System.out.println("b의값이 넘어왔나? : " + bTitle);
//		System.out.println("b의값이 넘어왔나? : " + bContent);
		Board board = new Board(bId, bTitle, bContent);
		int result = bService.updateFAQ(board);
		System.out.println("result " + result);
		j.put("result", result);
		if(result > 0) {
			return j.toJSONString();
		} else {
			return "redirect:boardFAQ.board";
		}
			
	}

	///////////////////////////////////////////
//	@RequestMapping("boardFAQ.board")
//	public ModelAndView goFAQPage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
//		
//		int currentPage = 1;
//		if(page != null) {
//			currentPage = page;
//		}
//		
//		int listCount = bService.boardFAQListCount();
////		System.out.println("listCount : " + listCount);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		
//		ArrayList<Board> list = bService.selectList(pi);
////		System.out.println(list);
//		if(list != null) {
//			mv.addObject("list", list);
//			mv.addObject("pi", pi);
//			mv.setViewName("/FAQ/boardFAQ");
//		}else {
//			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
//		}
//		
//		return mv;
//	}
	// 공지사항
	@RequestMapping("boardNoticeList.board")
	public ModelAndView goBoardNoticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		int listCount = bService.boardNoticeListCount();
		System.out.println("공지사항 게시글 갯수: " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectNoticeList(pi);
		System.out.println("공지사항 :" + list);
		
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
	public ModelAndView goNoticeDetail(@RequestParam("noticeId") int noticeId, @RequestParam("page") int page, ModelAndView mv) {
		
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
	@RequestMapping("NoticeWriteConfirm.board")
	public String NoticeWriteConfirm(@ModelAttribute Board b, Model model) {
		
		int result = bService.noticeInsert(b);
		
		if(result > 0) {
			return "redirect:boardNoticeList.board";
		}else {
			throw new BoardException("게시글 동록에 실패하였습니다.");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 1대1문의
	@RequestMapping("boardOneToOne.board")
	public String goBoardOneToOnePage() {
		
		return "/oneToOne/oneToOneList";
	}
	
	
	
	
	
	
	

	
	
}
