package com.san.dong.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.san.dong.member.model.vo.EstateAgent;
import com.san.dong.member.model.vo.Member;
import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.member.model.vo.MemberSearch;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int checkIdDup(SqlSessionTemplate sqlSession, String id) {
		
		return sqlSession.selectOne("memberMapper.checkIdDup", id);
	}


	// 일반회원 리스트 카운트
	public int getMemberListCount(SqlSessionTemplate sqlSession, MemberSearch ms) {
		return sqlSession.selectOne("memberMapper.getMemberListCount", ms);
	}
	
	// 일반회원 리스트 
	public ArrayList<Member> selectNormalMemberList(SqlSessionTemplate sqlSession ,MemberSearch ms, MemberPageInfo pi ) {
		int offset = (pi.getCurrentPage() - 1) * pi.getMemberLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getMemberLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectNormalMemberList" , ms, rowBounds);
	}
	
	// 회원 탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String us_id) {
		return sqlSession.update("memberMapper.deleteMember",us_id);
	}
	
	// 선택한 일반회원 정보
	public Member selectNormalMemberDetail(SqlSessionTemplate sqlSession, String us_id) {
		return (Member)sqlSession.selectOne("memberMapper.selectNormalMemberDetail", us_id);
	}

	// 중개사 리스트 카운트
	public int getEstateAgenListCount(SqlSessionTemplate sqlSession, MemberSearch ms) {
		return sqlSession.selectOne("memberMapper.getEstateAgenListCount", ms);
	}
	
	// 중개사 리스트 
	public ArrayList<EstateAgent> selectEstateAgenList(SqlSessionTemplate sqlSession, MemberSearch ms, MemberPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getMemberLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getMemberLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectEstateAgenList" , ms, rowBounds);
	}
	// 중개사 탈퇴
	public int deleteEstateAgent(SqlSessionTemplate sqlSession, String us_id) {
		return sqlSession.update("memberMapper.deleteEstateAgent",us_id);
	}
	// 중개사 정보
	public EstateAgent selectEstateDetail(SqlSessionTemplate sqlSession, String us_id) {
		return (EstateAgent)sqlSession.selectOne("memberMapper.selectEstateDetail", us_id);
	}
}
