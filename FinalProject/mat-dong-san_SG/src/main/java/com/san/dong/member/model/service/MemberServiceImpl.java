package com.san.dong.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.dong.member.model.dao.MemberDAO;
import com.san.dong.member.model.vo.EstateAgent;
import com.san.dong.member.model.vo.Member;
import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.member.model.vo.MemberSearch;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int checkIdDup(String id) {
		return mDAO.checkIdDup(sqlSession, id);
	}

	
	@Override
	public int getMemberListCount(MemberSearch ms) {
		return mDAO.getMemberListCount(sqlSession , ms);
	}
	
	@Override
	public ArrayList<Member> selectNormalMemberList(MemberSearch ms ,MemberPageInfo pi) {
		return mDAO.selectNormalMemberList(sqlSession, ms, pi);
	}


	@Override
	public int deleteMember(String us_id) {
		return mDAO.deleteMember(sqlSession,us_id);
	}

	@Override
	public int getEstateAgenListCount(MemberSearch ms) {
		return mDAO.getEstateAgenListCount(sqlSession , ms);
	}

	@Override
	public ArrayList<EstateAgent> selectEstateAgenList(MemberSearch ms, MemberPageInfo pi) {
		return mDAO.selectEstateAgenList(sqlSession, ms, pi);
	}

	@Override
	public int deleteEstateAgent(String us_id) {
		return mDAO.deleteEstateAgent(sqlSession,us_id);
	}

	@Override
	public Member selectNormalMemberDetail(String us_id) {
		return mDAO.selectNormalMemberDetail(sqlSession,us_id);
	}

	@Override
	public EstateAgent selectEstateDetail(String us_id) {
		return mDAO.selectEstateDetail(sqlSession,us_id);
	}
	
}