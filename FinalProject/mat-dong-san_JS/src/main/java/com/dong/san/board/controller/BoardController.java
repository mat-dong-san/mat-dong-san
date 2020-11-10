package com.dong.san.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView goBoardMainPage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.boardFAQListCount();
		System.out.println("listCount : " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		System.out.println(list);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("boardFAQ");
		}else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	@RequestMapping("InsertFAQ.board")
	public void insertFAQ(HttpServletResponse response, @RequestParam("rQuestion") String rQuestion, @RequestParam("rAnswer") String rAnswer) throws IOException {

		
		Board b = new Board(rQuestion, rAnswer);
		
//		if(result > 0 ) {
//			return " 
//		}else {
//			throw new BoardException("게시글 등록에 실패하였습니다.");
//		}
		
		int result = bService.insertFAQ(b);
		
		boolean isUsable;
		if(result > 0) {
			isUsable = true; 
		}else {
			isUsable = false; 
		}
		
		response.getWriter().print(isUsable);
		
	}
	
	
	@RequestMapping("boardMain.board")
	public String goBoardMainPage() {
		
		return "boardMain";
	}
	

	
	
	@RequestMapping("boardOneToOne.board")
	public String goBoardOneToOnePage() {
		
		return "boardOneToOne";
	}
	
	
	@RequestMapping("boardNotice.board")
	public String goBoardNoticePage() {
		
		return "boardNotice";
	}
	
	
	
	
	
	
	
	
	
}
