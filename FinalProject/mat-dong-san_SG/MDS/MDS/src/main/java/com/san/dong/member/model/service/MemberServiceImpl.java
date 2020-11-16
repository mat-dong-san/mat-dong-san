package com.san.dong.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.dong.member.model.dao.MemberDAO;
import com.san.dong.member.model.vo.Member;

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
	
}