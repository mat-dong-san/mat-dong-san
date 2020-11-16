package mat.dong.san.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mat.dong.san.product.vo.Product;
import mat.dong.san.search.common.Pagenation;
import mat.dong.san.search.service.SearchRoomService;
import mat.dong.san.search.service.SearchRoomServiceImpl;
import mat.dong.san.search.vo.SearchRoomPageInfo;

@Controller
public class SearchRoomController {
	
	@Autowired
	private SearchRoomService sService;

	@RequestMapping(value = "goSearchHomeMain.search", method = RequestMethod.GET)
	public String goSearchRoomMainPage(@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int productListCount = sService.selectProductCount();
		
		SearchRoomPageInfo pageInfo = Pagenation.getPageInfo(currentPage, productListCount);
		
		ArrayList<Product> productList = sService.selectAllProduct(pageInfo);
		
		return "searchRoomMainPage";
	}
	
	@RequestMapping(value = "SearchHomeMain.search", method = RequestMethod.GET)
	public String SearchRoomMainPage(@RequestParam("searchInput") String searchInput) {
		
		return "searchRoomMainPage";
	}
	
	@RequestMapping(value = "searchRoomDetailPage.search", method = RequestMethod.GET)
	public String goSearchRoomDetailPage() {
		
		return "searchRoomDetailPage";
	}
}
