package mat.dong.san.search.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.member.model.vo.EstateAgent;
import mat.dong.san.member.model.vo.EstateAgentReview;
import mat.dong.san.product.model.vo.Product;
import mat.dong.san.search.model.vo.SearchRoomFilter;
import mat.dong.san.search.model.vo.SearchRoomPageInfo;

@Repository("sDAO")
public class SearchRoomDAO {

	public int selectProductCount(SqlSessionTemplate sqlSession, String searchInput) {

		return sqlSession.selectOne("SearchRoomMapper.selectProductCount", searchInput);
	}
	
	public static ArrayList<Product> selectAllProduct(SqlSessionTemplate sqlSession, SearchRoomPageInfo pageInfo, String searchInput) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getProductLimit();
		RowBounds rowbounds = new RowBounds(offset, pageInfo.getProductLimit());
		
		return (ArrayList)sqlSession.selectList("SearchRoomMapper.selectProductList", searchInput, rowbounds);
	}

	public int selectFilterCount(SqlSessionTemplate sqlSession, SearchRoomFilter sf) {
		
		return sqlSession.selectOne("SearchRoomMapper.selectProductFilterCount", sf);
	}

	public ArrayList<Product> selectFilterProduct(SqlSessionTemplate sqlSession, SearchRoomFilter sf,
			SearchRoomPageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getProductLimit();
		RowBounds rowbounds = new RowBounds(offset, pageInfo.getProductLimit());
		
		return (ArrayList)sqlSession.selectList("SearchRoomMapper.selectFilterList", sf, rowbounds);
	}

	public Product selectProductDetail(SqlSessionTemplate sqlSession, Integer p_id) {

		return sqlSession.selectOne("SearchRoomMapper.selectProductDetail", p_id);
	}

	public EstateAgent selectAgent(SqlSessionTemplate sqlSession, int p_id) {

		return sqlSession.selectOne("SearchRoomMapper.selectAgent", p_id);
	}

	public ArrayList<EstateAgentReview> selectReview(SqlSessionTemplate sqlSession, int e_id) {

		return (ArrayList)sqlSession.selectList("SearchRoomMapper.selectReview", e_id);
	}

	public int insertReply(SqlSessionTemplate sqlSession, EstateAgentReview er) {

		return sqlSession.insert("SearchRoomMapper.insertReplay", er);
	}

	public int updatePointAvg(SqlSessionTemplate sqlSession, EstateAgentReview er) {

		return sqlSession.update("SearchRoomMapper.updatePoint", er);
	}

	public ArrayList<Product> selectProductEstate(SqlSessionTemplate sqlSession, String us_id) {

		return (ArrayList)sqlSession.selectList("SearchRoomMapper.selectProductEstate", us_id);
	}
	
}
