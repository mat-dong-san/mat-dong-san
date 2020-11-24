package mat.dong.san.product.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.product.dao.ProductDAO;
import mat.dong.san.product.vo.Note;
import mat.dong.san.product.vo.PageInfo;
import mat.dong.san.product.vo.Review;


@Service("pService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDAO pDAO;

	@Override
	public EstateAgent selectEstateAgent(String p_id) {
		return pDAO.selectEstateAgent(sqlSession, p_id);
	}

	@Override
	public int insertMessage(Note note) {
		return pDAO.insertMessage(sqlSession, note);
	}

	@Override
	public int getReviewCount(int e_id) {
		return pDAO.getReviewCount(sqlSession, e_id);
	}

	@Override
	public ArrayList<Review> selectReviewList(int e_id, PageInfo pi) {
		
		return pDAO.selectReviewList(sqlSession, e_id, pi);
	}
	
	@Override
	public int getTotalEstateAgentPoint(int e_id) {
		return pDAO.getTotalEstateAgentPoint(sqlSession, e_id);
	}

	@Override
	public int reviewIdCheck(String us_id, int e_id) {
		return pDAO.reviewIdCheck(sqlSession, us_id, e_id);
	}

	@Override
	public int updateEstateAgentPoint(int e_id, float avg) {
		return pDAO.updateEstateAgentPoint(sqlSession, e_id, avg);
		
	}

	@Override
	public int insertReview(Review review) {
		return pDAO.insertReview(sqlSession, review);
		
	}

	@Override
	public int deleteReview(int er_id) {
		return pDAO.deleteReview(sqlSession, er_id);
	}


	
}
