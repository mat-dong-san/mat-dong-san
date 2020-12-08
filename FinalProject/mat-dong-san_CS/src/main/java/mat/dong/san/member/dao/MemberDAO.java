package mat.dong.san.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.member.vo.Member;

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

	public int checkIdDup2(SqlSessionTemplate sqlSession, String id) {
		
		return sqlSession.selectOne("memberMapper.checkIdDup2", id);
	}

	public int insertEstateAgent(SqlSessionTemplate sqlSession, EstateAgent e) {
		
		return sqlSession.insert("memberMapper.insertEstateAgent", e);
	}

	public int checkNameDup(SqlSessionTemplate sqlSession, String name) {
		
		return sqlSession.selectOne("memberMapper.checkNameDup", name);
	}


	
}
