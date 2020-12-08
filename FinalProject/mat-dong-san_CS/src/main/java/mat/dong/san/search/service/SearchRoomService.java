package mat.dong.san.search.service;

import java.util.ArrayList;

import mat.dong.san.product.vo.Product;
import mat.dong.san.search.vo.SearchRoomPageInfo;

public interface SearchRoomService {
	
	ArrayList<Product> selectAllProduct(SearchRoomPageInfo pageInfo);

	int selectProductCount();

	Product selectProductRoom(Product p);
	
}
