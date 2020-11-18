package mat.dong.san.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mat.dong.san.product.exception.ProductException;
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
	
	
	//상품클릭할때 세션에저장(최근본매물)
	@RequestMapping(value = "selectProductRoom.search", method = RequestMethod.GET)
	public void selectProductRoom(Product p, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
		int cnt = 0;
		
		Product product = sService.selectProductRoom(p);
		if (product == null) {
		} else {

			ArrayList<Product> view = (ArrayList<Product>)session.getAttribute("pSession");
			if (view == null) {
				view = new ArrayList<Product>();
			}
			
			for (int i = 0; i < view.size(); i++) {
				  if (p.getP_id() == view.get(i).getP_id()) {
					  cnt = 1;
				  }
			}
			if(cnt == 0) {
				view.add(product);
			}
			
			session.setAttribute("pSession", view);
			
		}
		
	}
}
