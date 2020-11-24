package mat.dong.san.product.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import mat.dong.san.common.Pagination;
import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.product.service.ProductService;
import mat.dong.san.product.vo.Note;
import mat.dong.san.product.vo.PageInfo;
import mat.dong.san.product.vo.Product;
import mat.dong.san.product.vo.Review;

@SessionAttributes("pSession")
@Controller
public class ProductController {		
	
	@Autowired
	private ProductService pService;
	
	//체크박스삭제
	@RequestMapping("selectedCheck.pr")
	public void selectedCheck(@RequestParam("selectedCheck[]") List<Integer> selectedCheck , HttpSession session, HttpServletResponse response) throws IOException{

		String result = "1";
		
		ArrayList<Product> view = (ArrayList<Product>)session.getAttribute("pSession");
		if (view == null) {
			view = new ArrayList<Product>();
		}
		
		for (int i = 0; i < view.size(); i++) {
			
			
			for (int j = 0; j < selectedCheck.size(); j++) {
				if(view.get(i).getP_id() == selectedCheck.get(j)) {
					view.remove(i);
				}
			}
		}
		
		
		session.setAttribute("pSession", view);
		
		response.getWriter().print(result);
		
	}
	
	//매물중개사정보
	@RequestMapping("selectEstateAgent.pr")
	public void selectEstateAgent(@RequestParam("p_id") String p_id , HttpSession session, HttpServletResponse response) throws IOException{
		response.setContentType("application/json; charset=UTF-8");
		
		EstateAgent estateAgent = pService.selectEstateAgent(p_id);
		System.out.println(estateAgent);
		
		JSONObject estateAgentInfo = new JSONObject();
		estateAgentInfo.put("e_id", estateAgent.getE_id());
		estateAgentInfo.put("e_name", estateAgent.getE_name());
		estateAgentInfo.put("e_phone", estateAgent.getE_phone());
		estateAgentInfo.put("e_content", estateAgent.getE_content());
		estateAgentInfo.put("e_addr", estateAgent.getE_addr());
		estateAgentInfo.put("e_picture", estateAgent.getE_picture());
		estateAgentInfo.put("e_field", estateAgent.getE_field());
		estateAgentInfo.put("e_reg_num", estateAgent.getE_reg_num());
		estateAgentInfo.put("e_coord", estateAgent.getE_coord());
		estateAgentInfo.put("e_c_lat", estateAgent.getE_c_lat());
		estateAgentInfo.put("e_c_lng", estateAgent.getE_c_lng());
		estateAgentInfo.put("e_point", estateAgent.getE_point());
		estateAgentInfo.put("e_reg_d", estateAgent.getE_reg_d());
		estateAgentInfo.put("e_del_yn", estateAgent.getE_del_yn());
		estateAgentInfo.put("us_id", estateAgent.getUs_id());
		System.out.println(estateAgentInfo);
		
		new Gson().toJson(estateAgentInfo, response.getWriter());
		
	}
	
	//리뷰리스트
	@RequestMapping("estateAgentReview.pr")
	public void estateAgentReview(@RequestParam(value="page", required=false) Integer page, @RequestParam("e_id") int e_id, HttpServletResponse response) throws IOException{
		response.setContentType("application/json; charset=UTF-8");

		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = pService.getReviewCount(e_id);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Review> list = pService.selectReviewList(e_id, pi);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list>" + list.get(i));
		}
		
		
		JSONObject userObj = null;
		JSONArray review = null;
		JSONObject userMap = null;
		
		review = new JSONArray();
		userMap = new JSONObject();
		for(int i = 0; i < list.size(); i++) {

			userObj = new JSONObject();
			userObj.put("er_id", list.get(i).getEr_id());
			userObj.put("er_content", list.get(i).getEr_content());
			userObj.put("er_point", list.get(i).getEr_point());
			userObj.put("er_reg_d", list.get(i).getEr_reg_d());
			userObj.put("er_del_yn", list.get(i).getEr_del_yn());
			userObj.put("e_id", list.get(i).getE_id());
			userObj.put("us_id", list.get(i).getUs_id());
			userObj.put("us_name", list.get(i).getUs_name());
			userObj.put("us_picture", list.get(i).getUs_picture());
			
			review.add(userObj);
			userMap.put("review", review);
			
		}
		userObj = new JSONObject();
		userObj.put("listCount", listCount);
		userObj.put("currentPage", currentPage);
		userObj.put("pageLimit", pi.getPageLimit());
		userObj.put("boardLimit", pi.getBoardLimit());
		userObj.put("maxPage", pi.getMaxPage());
		userObj.put("startPage", pi.getStartPage());
		userObj.put("endPage", pi.getEndPage());
		userMap.put("pi", userObj);
			
		response.setContentType("application/json; charset=UTF-8");		
		new Gson().toJson(userMap, response.getWriter());
			
	}
	
	//리뷰등록
	@RequestMapping("insertReview.pr")
	public void insertReview(
			@RequestParam("er_content") String er_content,
			@RequestParam("er_point") int er_point,
			@RequestParam("e_id") int e_id,
			@RequestParam("us_id") String us_id, 
			HttpSession session, HttpServletResponse response) throws IOException{

		int reviewer_count= pService.getReviewCount(e_id);
		int sum_estateAgent_point= pService.getTotalEstateAgentPoint(e_id);
		
		System.out.println("er_point>" + er_point);
		System.out.println("reviewer_count>" + reviewer_count);
		System.out.println("sum_estateAgent_point>" + sum_estateAgent_point);
		
		int result = pService.reviewIdCheck(us_id, e_id);
		if(result > 0) { //아이디중복
			response.getWriter().print("1");
		}else { //등록
			float avg= (float)(er_point+ sum_estateAgent_point)/ (reviewer_count+1);
			pService.updateEstateAgentPoint(e_id, avg);
			double avg2 = Math.round(avg*100)/100.0;
			System.out.println(avg2);
			Review review = new Review();
			review.setE_id(e_id);
			review.setUs_id(us_id);
			review.setEr_point(er_point);
			review.setEr_content(er_content);
			
			pService.insertReview(review);
			
			response.getWriter().print(avg2);
		}
		
			
	}
	//리뷰삭제
	@RequestMapping("deleteReview.pr")
	public void deleteReview(
			@RequestParam("er_id") int er_id,
			@RequestParam("er_point") int er_point,
			@RequestParam("e_id") int e_id,
			HttpSession session, HttpServletResponse response) throws IOException{

		int result = pService.deleteReview(er_id);
		
		if(result > 0) {
			int reviewer_count= pService.getReviewCount(e_id);
			int sum_estateAgent_point= pService.getTotalEstateAgentPoint(e_id);
			float avg= (float)(sum_estateAgent_point - er_point)/ (reviewer_count-1);
			double avg2 = Math.round(avg*100)/100.0;
			pService.updateEstateAgentPoint(e_id, avg);
			response.getWriter().print(avg2);
		}else {
			response.getWriter().print("0");
		}
				
	}	
	
	
	//쪽지보내기
	@RequestMapping("insertMessage.pr")
	public void insertMessage(
			@RequestParam("us_id") String us_id,
			@RequestParam("p_id") int p_id,
			@RequestParam("e_id") int e_id,
			@RequestParam("un_content") String un_content, 
			HttpSession session, HttpServletResponse response) throws IOException{

		
		Note note = new Note();
		note.setE_id(e_id);
		note.setP_id(p_id);
		note.setUs_id(us_id);
		note.setUn_content(un_content);
		int result = pService.insertMessage(note);
		
		if(result > 0) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
		
	}
	
	// 최근본방 이동
	@RequestMapping("productRecentList.pr")
	public String productStorage() {
		return "productRecentList";
	}
	
	// 쪽지 이동
	@RequestMapping("note.pr")
	public String note() {
		return "note";
	}
	
	//테스트용도
	@RequestMapping("test.pr")
	public String test() {
		return "test";
	}
	
	//테스트용도
	@RequestMapping("test2.pr")
	public String test2() {
		return "test2";
	}
	
}
