package mat.dong.san.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mat.dong.san.product.model.vo.Product;
import mat.dong.san.search.common.Pagenation;
import mat.dong.san.search.model.exception.SearchRoomException;
import mat.dong.san.search.model.service.SearchRoomService;
import mat.dong.san.search.model.vo.SearchRoomPageInfo;

@Controller
public class SearchRoomController {
	
	@Autowired
	private SearchRoomService sService;

	@RequestMapping(value = "goSearchHomeMain.search", method = RequestMethod.GET)
	public ModelAndView goSearchRoomMainPage(@RequestParam(value="page", required=false) Integer page,@RequestParam(value="searchInput", required=false) String searchInput, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int productListCount = sService.selectProductCount(searchInput);
		
		SearchRoomPageInfo pageInfo = Pagenation.getPageInfo(currentPage, productListCount);
		
		ArrayList<Product> productList = sService.selectAllProduct(pageInfo, searchInput);
			
		if(productList != null) {
			mv.addObject("productList", productList);
			mv.addObject("pageInfo", pageInfo);
			mv.setViewName("searchRoomMainPage");
			mv.addObject("searchInput", searchInput);
		} else {
			throw new SearchRoomException("방 목록 조회에 실패하였습니다.");
		}
		
		return mv;
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
