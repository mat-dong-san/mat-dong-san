package mat.dong.san.product.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.product.vo.Note;
import mat.dong.san.product.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public EstateAgent selectEstateAgent(SqlSessionTemplate sqlSession, String p_id) {
		return sqlSession.selectOne("productMapper.selectEstateAgent", p_id);
	}

	public int insertMessage(SqlSessionTemplate sqlSession, Note note) {
		return sqlSession.insert("productMapper.insertMessage", note);
	}


}
