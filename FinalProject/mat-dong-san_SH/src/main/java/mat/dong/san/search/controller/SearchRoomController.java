package mat.dong.san.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import mat.dong.san.member.model.vo.EstateAgent;
import mat.dong.san.member.model.vo.EstateAgentReview;
import mat.dong.san.product.model.vo.Product;
import mat.dong.san.search.common.Pagenation;
import mat.dong.san.search.model.exception.SearchRoomException;
import mat.dong.san.search.model.service.SearchRoomService;
import mat.dong.san.search.model.vo.SearchRoomFilter;
import mat.dong.san.search.model.vo.SearchRoomPageInfo;

@Controller
public class SearchRoomController {
	
	@Autowired
	private SearchRoomService sService;

	@RequestMapping(value = "goSearchHomeMain.search", method = RequestMethod.GET)
	public ModelAndView goSearchRoomMainPage(
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="searchInput", required=false) String searchInput,
			@RequestParam(value="one", required=false) String one,
			@RequestParam(value="two", required=false) String two,
			@RequestParam(value="three", required=false) String three,
			@RequestParam(value="monthly", required=false) String monthly,
			@RequestParam(value="charter", required=false) String charter,
			@RequestParam(value="build1", required=false) String build1,
			@RequestParam(value="build2", required=false) String build2,
			@RequestParam(value="build3", required=false) String build3,
			@RequestParam(value="build4", required=false) String build4,
			@RequestParam(value="minCharter", required=false) Integer minCharter,
			@RequestParam(value="maxCharter", required=false) Integer maxCharter,
			@RequestParam(value="minMonthly", required=false) Integer minMonthly,
			@RequestParam(value="maxMonthly", required=false) Integer maxMonthly,
			@RequestParam(value="parkType", required=false) String parkType,
			@RequestParam(value="petType", required=false) String petType,
			@RequestParam(value="eleType", required=false) String eleType,
			ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		SearchRoomFilter sf = new SearchRoomFilter();
		
		int productListCount = sService.selectProductCount(searchInput);
		
		SearchRoomPageInfo pageInfo = Pagenation.getPageInfo(currentPage, productListCount);
		
		ArrayList<Product> productList = sService.selectAllProduct(pageInfo, searchInput);
		
		if(productList != null) {
			mv.addObject("productList", productList);
			mv.addObject("pageInfo", pageInfo);
			mv.setViewName("searchRoomMainPage");
			mv.addObject("searchInput", searchInput);
			mv.addObject("filter", sf);
		} else {
			throw new SearchRoomException("방 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	
	}
	@RequestMapping(value = "goPagingMainPage.search", method = RequestMethod.GET)
	public ModelAndView goPagingMainPage(
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="searchInput", required=false) String searchInput,
			@RequestParam(value="one", required=false) String one,
			@RequestParam(value="two", required=false) String two,
			@RequestParam(value="three", required=false) String three,
			@RequestParam(value="monthly", required=false) String monthly,
			@RequestParam(value="charter", required=false) String charter,
			@RequestParam(value="build1", required=false) String build1,
			@RequestParam(value="build2", required=false) String build2,
			@RequestParam(value="build3", required=false) String build3,
			@RequestParam(value="build4", required=false) String build4,
			@RequestParam(value="minCharter", required=false) Integer minCharter,
			@RequestParam(value="maxCharter", required=false) Integer maxCharter,
			@RequestParam(value="minMonthly", required=false) Integer minMonthly,
			@RequestParam(value="maxMonthly", required=false) Integer maxMonthly,
			@RequestParam(value="parkType", required=false) String parkType,
			@RequestParam(value="petType", required=false) String petType,
			@RequestParam(value="eleType", required=false) String eleType,
			ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		SearchRoomFilter sf = new SearchRoomFilter();
		sf.getRoomType().clear();
		if(!one.equals("empty")) {
			sf.getRoomType().add(one);
		}
		if(!two.equals("empty")) {
			sf.getRoomType().add(two);
		}
		if(!three.equals("empty")) {
			sf.getRoomType().add(three);
		}
		sf.getTradeType().clear();
		if(!monthly.equals("empty")) {
			sf.getTradeType().add(monthly);
		}
		if(!charter.equals("empty")) {
			sf.getTradeType().add(charter);
		}
		sf.getBuildType().clear();
		if(!build1.equals("empty")) {
			sf.getBuildType().add(build1);
		}
		if(!build2.equals("empty")) {
			sf.getBuildType().add(build2);
		}
		if(!build3.equals("empty")) {
			sf.getBuildType().add(build3);
		}
		if(!build4.equals("empty")) {
			sf.getBuildType().add(build4);
		}
		sf.setMinCharter(minCharter);
		sf.setMaxCharter(maxCharter);
		sf.setMinMonthly(minMonthly);
		sf.setMaxMonthly(maxMonthly);
		sf.setParkType(parkType);
		sf.setPetType(petType);
		sf.setEleType(eleType);
		
		if(searchInput != null){
			if(!searchInput.equals("")) {
				sf.setSearchInput(searchInput);
			}
		}
		
		int productListFilterCount = sService.selectProductFilterCount(sf);
		
		SearchRoomPageInfo pageInfo = Pagenation.getPageInfo(currentPage, productListFilterCount);
		
		ArrayList<Product> productList = sService.selectFilterProduct(pageInfo, sf);
		
		if(productList != null) {
			mv.addObject("productList", productList);
			mv.addObject("pageInfo", pageInfo);
			mv.setViewName("searchRoomMainPage");
			mv.addObject("searchInput", searchInput);
			mv.addObject("filter", sf);
		} else {
			throw new SearchRoomException("방 목록 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	@RequestMapping(value = "goSearchFilter.search", method = RequestMethod.GET)
	public void goSearchRoomMainPage(
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="searchInput", required=false) String searchInput, 
			@RequestParam(value="one", required=false) String one,
			@RequestParam(value="two", required=false) String two,
			@RequestParam(value="three", required=false) String three,
			@RequestParam(value="monthly", required=false) String monthly,
			@RequestParam(value="charter", required=false) String charter,
			@RequestParam(value="build1", required=false) String build1,
			@RequestParam(value="build2", required=false) String build2,
			@RequestParam(value="build3", required=false) String build3,
			@RequestParam(value="build4", required=false) String build4,
			@RequestParam(value="minCharter", required=false) Integer minCharter,
			@RequestParam(value="maxCharter", required=false) Integer maxCharter,
			@RequestParam(value="minMonthly", required=false) Integer minMonthly,
			@RequestParam(value="maxMonthly", required=false) Integer maxMonthly,
			@RequestParam(value="parkType", required=false) String parkType,
			@RequestParam(value="petType", required=false) String petType,
			@RequestParam(value="eleType", required=false) String eleType,
			HttpServletResponse response
			) {
		
		int currentPage = 1;
		
		SearchRoomFilter sf = new SearchRoomFilter();
		sf.getRoomType().clear();
		if(!one.equals("empty")) {
			sf.getRoomType().add(one);
		}
		if(!two.equals("empty")) {
			sf.getRoomType().add(two);
		}
		if(!three.equals("empty")) {
			sf.getRoomType().add(three);
		}
		sf.getTradeType().clear();
		if(!monthly.equals("empty")) {
			sf.getTradeType().add(monthly);
		}
		if(!charter.equals("empty")) {
			sf.getTradeType().add(charter);
		}
		sf.getBuildType().clear();
		if(!build1.equals("empty")) {
			sf.getBuildType().add(build1);
		}
		if(!build2.equals("empty")) {
			sf.getBuildType().add(build2);
		}
		if(!build3.equals("empty")) {
			sf.getBuildType().add(build3);
		}
		if(!build4.equals("empty")) {
			sf.getBuildType().add(build4);
		}
		sf.setMinCharter(minCharter);
		sf.setMaxCharter(maxCharter);
		sf.setMinMonthly(minMonthly);
		sf.setMaxMonthly(maxMonthly);
		sf.setParkType(parkType);
		sf.setPetType(petType);
		sf.setEleType(eleType);
		
		System.out.println(searchInput);
		
		if(searchInput != null){
			if(!searchInput.equals("")) {
				sf.setSearchInput(searchInput);
			}
		}
		
		
		int productListFilterCount = sService.selectProductFilterCount(sf);
		
		SearchRoomPageInfo pageInfo = Pagenation.getPageInfo(currentPage, productListFilterCount);
		
		ArrayList<Product> productList = sService.selectFilterProduct(pageInfo, sf);
		
		try {
			
			response.setContentType("application/json; charset=UTF-8");
			ArrayList list = new ArrayList();
			list.add(pageInfo);
			list.add(productList);
			new Gson().toJson(list,response.getWriter());
			
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value = "SearchHomeMain.search", method = RequestMethod.GET)
	public String SearchRoomMainPage(@RequestParam("searchInput") String searchInput) {
		
		return "searchRoomMainPage";
	}
	
	@RequestMapping(value = "searchRoomDetailPage.search", method = RequestMethod.GET)
	public ModelAndView goSearchRoomDetailPage(@RequestParam("p_id") Integer p_id, ModelAndView mv) {
		
		System.out.println("p_id : " + p_id);
		// 매물 정보
		Product product = sService.selectProductDetail(p_id);
		String[] productArr = product.getP_picture().split("/");
		ArrayList<String> productPictureList = new ArrayList<String>();
		
		for(int i = 1; i < productArr.length; i++) {
			productPictureList.add(productArr[i]);
		}
		
		// 중개사 정보
		EstateAgent ea = sService.selectAgent(p_id);
		// 중개사의 댓글정보
		ArrayList<EstateAgentReview> reviewList = sService.selectReview(ea.getE_id()); 
		// 중개사보유 매물 리스트
		ArrayList<Product> productList = sService.selectProductEstate(ea.getUs_id());

		if(product != null) {
			mv.addObject("product", product);
			mv.addObject("EstateAgent", ea);
			mv.addObject("review", reviewList);
			mv.addObject("productList", productList);
			mv.addObject("pictureList", productPictureList);
			mv.setViewName("searchRoomDetailPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "replyAdd.search")
	public void addReply(
			@RequestParam("er_point") Integer er_point, 
			@RequestParam("er_content") String er_content,
			@RequestParam("estate_id") Integer e_id,
			@RequestParam("us_id") String us_id,
			HttpServletResponse response){

		EstateAgentReview er = new EstateAgentReview();
		er.setEr_content(er_content);
		er.setE_id(e_id);
		er.setUs_id(us_id);
		er.setEr_point(er_point);
		int result = sService.insertReply(er);
		
		if(result > 0) {
			int result2 = sService.updatePointAvg(er);
			if(result2 > 0) {
				try {
					
					ArrayList<EstateAgentReview> reviewList = sService.selectReview(e_id);
					response.setContentType("application/json; charset=UTF-8");
					GsonBuilder gb = new GsonBuilder();
					GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
					Gson gson = df.create();
					gson.toJson(reviewList,response.getWriter());
					
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
	}
	
	@RequestMapping("openMessage.search")
	public String openPup() {
		
		return "../common/message";
	}
	
}



















