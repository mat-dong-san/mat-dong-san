package mat.dong.san.search.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.product.model.vo.Product;
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

	
}
