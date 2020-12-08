package mat.dong.san.search.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.product.vo.Product;
import mat.dong.san.search.vo.SearchRoomPageInfo;

@Repository("sDAO")
public class SearchRoomDAO {

	public int selectProductCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("SearchRoomMapper.selectProductCount");
	}
	
	public static ArrayList<Product> selectAllProduct(SqlSessionTemplate sqlSession, SearchRoomPageInfo pageInfo) {
		
		return null;
	}

	
	public Product selectProductRoom(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.selectOne("SearchRoomMapper.selectProductRoom", p);
	}
	
	
}
