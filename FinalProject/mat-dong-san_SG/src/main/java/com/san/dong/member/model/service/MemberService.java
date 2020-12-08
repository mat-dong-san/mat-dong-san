package com.san.dong.member.model.service;

import java.util.ArrayList;

import com.san.dong.member.model.vo.EstateAgent;
import com.san.dong.member.model.vo.Member;
import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.member.model.vo.MemberSearch;

public interface MemberService {
	
	Member memberLogin(Member m);

	int insertMember(Member m);

	int checkIdDup(String id);
	
	//카운트다운
	int getMemberListCount(MemberSearch ms);

	// 일반회원 리스트 불러오기
	ArrayList<Member> selectNormalMemberList(MemberSearch ms, MemberPageInfo pi);

	int deleteMember(String us_id);

	int getEstateAgenListCount(MemberSearch ms);

	ArrayList<EstateAgent> selectEstateAgenList(MemberSearch ms, MemberPageInfo pi);

	int deleteEstateAgent(String us_id);

	Member selectNormalMemberDetail(String us_id);

	EstateAgent selectEstateDetail(String us_id);

}
