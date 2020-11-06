package com.san.dong.member.model.service;

import com.san.dong.member.model.vo.EstateAgent;
import com.san.dong.member.model.vo.Member;

public interface MemberService {
	Member memberLogin(Member m);

	int insertMember(Member m);

	int checkIdDup(String id);

	int checkIdDup2(String id);

	int insertEstateAgent(EstateAgent e);

	int checkNameDup(String name);

}
