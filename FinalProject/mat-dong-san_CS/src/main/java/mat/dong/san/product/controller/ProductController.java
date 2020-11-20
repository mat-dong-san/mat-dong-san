package mat.dong.san.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import mat.dong.san.member.exception.MemberException;
import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.product.service.ProductService;
import mat.dong.san.product.vo.Note;
import mat.dong.san.product.vo.Product;

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
