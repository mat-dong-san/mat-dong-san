package mat.dong.san.product.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.product.vo.Note;
import mat.dong.san.product.vo.PageInfo;
import mat.dong.san.product.vo.Product;
import mat.dong.san.product.vo.Review;

@Repository("pDAO")
public class ProductDAO {

	public EstateAgent selectEstateAgent(SqlSessionTemplate sqlSession, String p_id) {
		return sqlSession.selectOne("productMapper.selectEstateAgent", p_id);
	}

	public int insertMessage(SqlSessionTemplate sqlSession, Note note) {
		return sqlSession.insert("productMapper.insertMessage", note);
	}

	public int getReviewCount(SqlSessionTemplate sqlSession, int e_id) {
		
		return sqlSession.selectOne("productMapper.getReviewCount", e_id);
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int e_id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		System.out.println(rowBounds);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectReviewList", e_id, rowBounds);
	}

	public int getTotalEstateAgentPoint(SqlSessionTemplate sqlSession, int e_id) {
		return sqlSession.selectOne("productMapper.getTotalEstateAgentPoint", e_id);
	}

	public int reviewIdCheck(SqlSessionTemplate sqlSession, @Param("us_id") String us_id, @Param("e_id") int e_id) {
		Map map = new HashMap();
		map.put( "us_id", us_id );
		map.put( "e_id", e_id );
		return sqlSession.selectOne("productMapper.reviewIdCheck", map);
	}

	public int updateEstateAgentPoint(SqlSessionTemplate sqlSession, @Param("e_id") int e_id, @Param("avg") double avg) {
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "avg", avg );
		return sqlSession.update("productMapper.updateEstateAgentPoint", map);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("productMapper.insertReview", review);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int er_id) {
		return sqlSession.update("productMapper.deleteReview", er_id);
	}

	
	

}
