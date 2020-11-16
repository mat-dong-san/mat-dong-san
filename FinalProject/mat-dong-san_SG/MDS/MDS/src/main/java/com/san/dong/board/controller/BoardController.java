package com.san.dong.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller //@Component의 확장판(@Component + Controller의 성격 추가)
public class BoardController {
	
	// 매물올리기 페이지 이동
	@RequestMapping("raiseRoom.bo")
	public String raiseRoom() {
		return "raiseRoom";
	}
	
//	@Autowired
//	private BoardService bService;

}
