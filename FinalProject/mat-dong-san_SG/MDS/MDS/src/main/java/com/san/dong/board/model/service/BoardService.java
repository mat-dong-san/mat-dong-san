package com.san.dong.board.model.service;

import com.san.dong.member.model.vo.Member;

public interface BoardService {
	
	Member memberLogin(Member m);

	int insertMember(Member m);

	int checkIdDup(String id);
}
