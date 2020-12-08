package com.san.dong.product.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.san.dong.member.model.exception.MemberException;
import com.san.dong.product.model.service.ProductService;
import com.san.dong.product.model.vo.Product;

@SessionAttributes("loginUser")
@Controller //@Component의 확장판(@Component + Controller의 성격 추가)
public class ProductController {
	
	@Autowired
	private ProductService pService;

	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 매물올리기 페이지 이동
	@RequestMapping("postRoomForm.bo")
	public String raiseRoom() {
		System.out.println("dao");
		return "postRoom";
	}
	// 매물올리기 등록누를시
	@RequestMapping("postRoom.bo")
	public String raiseRoomConfirm(@ModelAttribute Product p,
//			@RequestParam("p_s_size1") String p_s_size1,
//			@RequestParam("p_s_size2") String p_s_size2,
//			@RequestParam("p_d_size1") String p_d_size1,
//			@RequestParam("p_d_size2") String p_d_size2,
			@RequestParam("p_content1") String p_content1,
			@RequestParam("p_content2") String p_content2,
			@RequestParam("us_id") String us_id,
			@RequestParam("us_type") String us_type,
			@RequestParam("file[]") MultipartFile[] p_picture,
			 HttpServletRequest request
			) {
		p.setUs_id(us_id); 
		p.setP_content(p_content1 +"////"+ p_content2);
		System.out.println(p);
		String renameFileName1 =  "";
		
		// 검색없이 리스트 카운트 가져오기
		int listCount = pService.getProductListCount();
		
		System.out.println("listCount:"+listCount);
		
		int count = 0;
		
		for(MultipartFile f : p_picture) {
			count++;
			if(!f.isEmpty()) {
				// saveFile() : 파일을 저장할 경로 지정
				String renameFileName2 = saveFile(f, request ,count, us_id,listCount+1, p.getP_id());
				System.out.println("renameFileName2"+renameFileName2);
				/* p.setP_picture(renameFileName); */
				if(renameFileName2 != null) {
					/* renameFileName1[i] = renameFileName2; */
					renameFileName1 =renameFileName1 + "/" + renameFileName2  ;
				}
			}
		}
		System.out.println(p);
		System.out.println(renameFileName1);
		p.setP_picture(renameFileName1);
		
		int result = pService.postRoom(p);
		
		if(result > 0) { 
			return "redirect:home.do";
		}else {
			throw new MemberException("등록에 실패하셨습니다..");
		}
	}
	

	// 파일을 저장할 경로 지정
	public String saveFile(MultipartFile file, HttpServletRequest request , int count, String us_id, int listCount, int p_id) {
		String root = request.getSession().getServletContext().getRealPath("resources");
//		System.out.println(root);
		String savePath = root + "\\images\\"+ us_id + "\\" + listCount;
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
//		String picture = "_PICTURE";
//		
//		SimpleDateFormat sdf = new SimpleDateFormat(count+picture);
//		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renameFileName = count + "_PICTURE.PNG" ;
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		return renameFileName;
	}
	
}
