package mat.dong.san.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.member.dao.MemberDAO;
import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.member.vo.Member;

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
	public int checkIdDup2(String id) {
		
		return mDAO.checkIdDup2(sqlSession, id);
	}

	@Override
	public int insertEstateAgent(EstateAgent e) {
		
		return mDAO.insertEstateAgent(sqlSession, e);
	}

	@Override
	public int checkNameDup(String name) {
		
		return mDAO.checkNameDup(sqlSession, name);
	}
	
}