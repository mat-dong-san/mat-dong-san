package mat.dong.san.search.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.product.vo.Product;
import mat.dong.san.search.dao.SearchRoomDAO;
import mat.dong.san.search.vo.SearchRoomPageInfo;

@Service("sService")
public class SearchRoomServiceImpl implements SearchRoomService{
		
	@Autowired
	private SearchRoomDAO sDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectProductCount() {
		
		return sDAO.selectProductCount(sqlSession);
	}
	
	@Override
	public ArrayList<Product> selectAllProduct(SearchRoomPageInfo pageInfo) {

		return sDAO.selectAllProduct(sqlSession, pageInfo);
	}
	
}
