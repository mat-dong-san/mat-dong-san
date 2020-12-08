package mat.dong.san.search.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.member.model.vo.EstateAgent;
import mat.dong.san.member.model.vo.EstateAgentReview;
import mat.dong.san.product.model.vo.Product;
import mat.dong.san.search.model.dao.SearchRoomDAO;
import mat.dong.san.search.model.vo.SearchRoomFilter;
import mat.dong.san.search.model.vo.SearchRoomPageInfo;

@Service("sService")
public class SearchRoomServiceImpl implements SearchRoomService{
		
	@Autowired
	private SearchRoomDAO sDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectProductCount(String searchInput) {
		
		return sDAO.selectProductCount(sqlSession, searchInput);
	}
	
	@Override
	public ArrayList<Product> selectAllProduct(SearchRoomPageInfo pageInfo, String searchInput) {

		return sDAO.selectAllProduct(sqlSession, pageInfo, searchInput);
	}
	
	@Override
	public int selectProductFilterCount(SearchRoomFilter sf) {

		return sDAO.selectFilterCount(sqlSession, sf);
	}
	
	@Override
	public ArrayList<Product> selectFilterProduct(SearchRoomPageInfo pageInfo, SearchRoomFilter sf) {

		return sDAO.selectFilterProduct(sqlSession, sf, pageInfo);
	}
	
	@Override
	public Product selectProductDetail(Integer p_id) {

		return sDAO.selectProductDetail(sqlSession, p_id);
	}
	
	@Override
	public EstateAgent selectAgent(int p_id) {

		return sDAO.selectAgent(sqlSession, p_id);
	}
	
	@Override
	public ArrayList<EstateAgentReview> selectReview(int e_id) {

		return sDAO.selectReview(sqlSession, e_id);
	}
	
	@Override
	public int insertReply(EstateAgentReview er) {

		return sDAO.insertReply(sqlSession, er);
	}
	
	@Override
	public int updatePointAvg(EstateAgentReview er) {

		return sDAO.updatePointAvg(sqlSession, er);
	}
	
	@Override
	public ArrayList<Product> selectProductEstate(String us_id) {

		return sDAO.selectProductEstate(sqlSession, us_id);
	}
}
