package mat.dong.san.search.model.service;

import java.util.ArrayList;

import mat.dong.san.product.model.vo.Product;
import mat.dong.san.search.model.vo.SearchRoomFilter;
import mat.dong.san.search.model.vo.SearchRoomPageInfo;

public interface SearchRoomService {
	
	ArrayList<Product> selectAllProduct(SearchRoomPageInfo pageInfo, String searchInput);

	int selectProductCount(String searchInput);

	int selectProductFilterCount(SearchRoomFilter sf);

	ArrayList<Product> selectFilterProduct(SearchRoomPageInfo pageInfo, SearchRoomFilter sf);

	Product selectProductDetail(Integer p_id);

}
