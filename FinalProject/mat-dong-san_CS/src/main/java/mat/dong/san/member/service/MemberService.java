package mat.dong.san.member.service;

import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.member.vo.Member;

public interface MemberService {
	Member memberLogin(Member m);

	int insertMember(Member m);

	int checkIdDup(String id);

	int checkIdDup2(String id);

	int insertEstateAgent(EstateAgent e);

	int checkNameDup(String name);

}
