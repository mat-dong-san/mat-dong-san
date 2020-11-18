package mat.dong.san.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


import mat.dong.san.member.exception.MemberException;
import mat.dong.san.product.exception.ProductException;
import mat.dong.san.product.service.ProductService;
import mat.dong.san.product.vo.Product;
import sun.java2d.opengl.WGLSurfaceData.WGLVSyncOffScreenSurfaceData;

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
		String result = "";
		
		
		
		response.getWriter().print(result);
		
	}
	
	// 최근본방 이동
	@RequestMapping("productRecentList.pr")
	public String productStorage() {
		return "productRecentList";
	}
	
	//테스트용도
	@RequestMapping("test.pr")
	public String mypageView() {
		return "test";
	}
	
}
