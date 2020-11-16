package mat.dong.san.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	// 
	@RequestMapping("selectProductRoom.search")
	public void selectProductRoom(Product p, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
		boolean isUsable;
		System.out.println("================================================================================");
		System.out.println("1P_ID>"+p.getP_id());
		
		Product product = pService.selectProductRoom(p);
		if (product == null) {
			throw new ProductException("상품보기에 실패했습니다.");
			
		} else {

			ArrayList<Product> view = (ArrayList<Product>)session.getAttribute("pSession");
			if (view == null) {
				view = new ArrayList<Product>();
			}
			
			
			
			
			
			
			for (int i = 0; i < view.size(); i++) {
				  System.out.println("pID>>>>>>"+p.getP_id());
				  System.out.println("배열>"+view.get(i).getP_id());
				  
				  if (p.getP_id() == view.get(i).getP_id()) {
					  
				  }
			}
			
			view.add(product);
			isUsable = true;
			for (int i = 0; i < view.size(); i++) {
				System.out.println(view.get(i));
			}
			
			
			session.setAttribute("pSession", view);
			
			model.addAttribute("product", product);
			
			response.getWriter().print(isUsable);
		}
		
	}
	
	// 방찾기테스트
	@RequestMapping("gosSarchHouseMain.search")
	public String gosSarchHouseMain() {
		return "test";
	}
	
	// 최근본방 이동
	@RequestMapping("productRecentList.search")
	public String productStorage() {
		return "productRecentList";
	}

}
