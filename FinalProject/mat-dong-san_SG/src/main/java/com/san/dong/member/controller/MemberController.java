package com.san.dong.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.san.dong.member.model.common.Pagination;
import com.san.dong.member.model.exception.MemberException;
import com.san.dong.member.model.service.MemberService;
import com.san.dong.member.model.vo.EstateAgent;
import com.san.dong.member.model.vo.Member;
import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.member.model.vo.MemberSearch;
import com.san.dong.product.model.service.ProductService;
import com.san.dong.product.model.vo.Product;
import com.san.dong.productApplication.model.service.ProductApplicationService;
import com.san.dong.productApplication.model.vo.ProductApplication;
import com.san.dong.productApplication.model.vo.ProductApplicationSearch;


@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ProductApplicationService paService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 로그인이동
	@RequestMapping("loginView.me")
	public String loginView() {
		return "memberLogin";
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();
		return "redirect:home.do";
	}
	
	// 관리자마이페이지 -> 회원 관리
	@RequestMapping("mypage.me")
	public String mypage_memberManagement(@ModelAttribute("loginUser") Member m, 
			@RequestParam(value = "currentPage", required = false) Integer page,
			@RequestParam(value= "searchCondition",required= false) String searchCondition,
			@RequestParam(value= "searchValue",required= false) String searchValue,
			Model model ) {

		System.out.println(m.getUs_type());
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		MemberSearch ms = new MemberSearch(m.getUs_id(),searchCondition,searchValue,"1","1","1","1","1","1","1","1");
		
		System.out.println(page+"/"+m.getUs_id()+"/"+searchCondition+"/"+searchValue);

		int listCount = mService.getMemberListCount(ms);
		
		System.out.println(listCount);
		
		MemberPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = mService.selectNormalMemberList(ms,pi);
		
		System.out.println(list);
		
		if(m.getUs_type().equals("관리자")) {
			model.addAttribute("list", list);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("pi", pi);
		}
		return "mypage";
	}
	
	// 관리자페이지에서 일반회원 계정삭제
	@RequestMapping("deleteNormalMember.me")
	public void deleteNormalMember(@RequestParam("us_id") String us_id, 
			HttpServletResponse response,
			@ModelAttribute("loginUser") Member m, 
			@RequestParam(value = "currentPage", required = false) Integer page,
			@RequestParam(value= "searchCondition",required= false) String searchCondition,
			@RequestParam(value= "searchValue",required= false) String searchValue,
			Model model ) throws IOException {
		
		
		System.out.println(m.getUs_type());
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		MemberSearch ms = new MemberSearch(m.getUs_id(),searchCondition,searchValue,"1","1","1","1","1","1","1","1");
		
		System.out.println(page+"/"+m.getUs_id()+"/"+searchCondition+"/"+searchValue);

		int listCount = mService.getMemberListCount(ms);
		
		System.out.println(listCount);
		
		MemberPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = mService.selectNormalMemberList(ms,pi);

		System.out.println("list:" +list);
		
		if(m.getUs_type().equals("관리자")) {
			model.addAttribute("list", list);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("pi", pi);
		}
		int result = mService.deleteMember(us_id);
		
		response.getWriter().print("1");
	}
	
	// 관리자 회원관리페이지 -> 회원상세페이지 
	@RequestMapping("goMemberDetailPage.me")
	public String goMemberDetailPage(@RequestParam("us_id") String us_id, // 선택한 아이디
			@RequestParam(value = "productCurrentPage", required = false) Integer productCurrentPage, //매물 페이징 및 검색 데이터
			@RequestParam(value = "productSearchCondition",required= false) String productSearchCondition,
			@RequestParam(value = "productSearchValue",required= false) String productSearchValue,
			@RequestParam(value = "commentCurrentPage", required = false) Integer commentCurrentPage, //댓글 페이징 및 검색 데이터
			@RequestParam(value = "commentSearchCondition",required= false) String commentSearchCondition,
			@RequestParam(value = "commentSearchValue",required= false) String commentSearchValue,
			@RequestParam(value = "usedCurrentPage", required = false) Integer usedCurrentPage, //중고 페이징 및 검색 데이터
			@RequestParam(value = "usedSearchCondition",required= false) String usedSearchCondition,
			@RequestParam(value = "usedSearchValue",required= false) String usedSearchValue,
			@RequestParam(value = "oneToOneCurrentPage", required = false) Integer oneToOneIdCurrentPage, // 1대1문의 페이징 및 검색 데이터
			@RequestParam(value = "oneToOneSearchCondition",required= false) String oneToOneIdSearchCondition,
			@RequestParam(value = "oneToOneIdSearchValue",required= false) String oneToOneIdSearchValue,
			Model model) {
		
		System.out.println("us_id:"+us_id);
		System.out.println("productCurrentPage:"+productCurrentPage+"+productSearchCondition:"+productSearchCondition+"+productSearchValue:"+productSearchValue);
		
		int productCurrentPage2 = 1;
		if(productCurrentPage != null) {
			productCurrentPage2 = productCurrentPage;
		}
		
		int commentCurrentPage2 = 1;
		if(commentCurrentPage != null) {
			commentCurrentPage2 = commentCurrentPage;
		}
		
		int usedCurrentPage2 = 1;
		if(usedCurrentPage != null) {
			usedCurrentPage2 = usedCurrentPage;
		}
		
		int oneToOneIdCurrentPage2 = 1;
		if(oneToOneIdCurrentPage != null) {
			oneToOneIdCurrentPage2 = oneToOneIdCurrentPage;
		}
		
		MemberSearch ms = new MemberSearch(us_id,"1","1",productSearchCondition,productSearchValue,commentSearchCondition,commentSearchValue,
				usedSearchCondition,usedSearchValue,oneToOneIdSearchCondition,oneToOneIdSearchValue);
		
		int productListCount = pService.productListCount(ms);
//		int commentListCount = mService.commentListCount(ms);
//		int usedListCount = mService.usedListCount(ms);
//		int oneToOneListCount = mService.oneToOneListCount(ms);
		
		MemberPageInfo ppi = Pagination.getPageInfo(productCurrentPage2, productListCount);
//		MemberPageInfo cpi = Pagination.productGetPageInfo(commentCurrentPage2, commentListCount);
//		MemberPageInfo upi = Pagination.productGetPageInfo(usedCurrentPage2, usedListCount);
//		MemberPageInfo opi = Pagination.productGetPageInfo(oneToOneIdCurrentPage2, oneToOneListCount);
		// 회원 정보
		Member member = mService.selectNormalMemberDetail(us_id);
		// 매물리스트
		ArrayList<Product> productList = pService.selectProductList(ms,ppi);
		// 매물 상세보기 정보 
		
//		Product product = pService.selectBoardDetail(us_id);
//		
//		String p_content1 = product.getP_content();
//		String p_content2 = p_content1.substring(p_content1.lastIndexOf("///")+1);
//	    System.out.println("p_content2:"+p_content2);
//	    product.setP_content(p_content2);
	    
		// 댓글리스트
//		ArrayList<Comment> commentList = pService.selectCommentList(ms,cpi);
//		// 중고리스트
//		ArrayList<Used> usedList = pService.selectUsedList(ms,upi);
//		// 1대1문의
//		ArrayList<OneToOne> oneToOneList = pService.selectoneToOneList(ms,opi);
		
		model.addAttribute("member", member);
		model.addAttribute("productList", productList);
//		model.addAttribute("commentList",commentList);
//		model.addAttribute("usedList", usedList);
//		model.addAttribute("oneToOneList", oneToOneList);
		
		model.addAttribute("productSearchCondition", productSearchCondition);
		model.addAttribute("productSearchValue", productSearchValue);
//		model.addAttribute("commentSearchCondition", commentSearchCondition);
//		model.addAttribute("commentSearchValue", commentSearchValue);
//		model.addAttribute("usedSearchCondition", usedSearchCondition);
//		model.addAttribute("usedSearchValue", usedSearchValue);
//		model.addAttribute("oneToOneIdSearchCondition", oneToOneIdSearchCondition);
//		model.addAttribute("oneToOneIdSearchValue", oneToOneIdSearchValue);
		
		model.addAttribute("ppi",ppi);
		System.out.println("start:"+ppi.getStartPage()+"end:"+ppi.getEndPage());
//		model.addAttribute("cpi",cpi);
//		model.addAttribute("upi",upi);
//		model.addAttribute("opi",opi);
		
		model.addAttribute("us_id",us_id);
		
		return "mypage_memberInfo";
		
	}
	
	// 관리자마이페이지 -> 중개사 관리
	@RequestMapping("goEstateAgentListPage.me")
	public String mypage_mEstateAgentManagement(@ModelAttribute("loginUser") Member m, 
			@RequestParam(value = "currentPage", required = false) Integer page,
			@RequestParam(value= "searchCondition",required= false) String searchCondition,
			@RequestParam(value= "searchValue",required= false) String searchValue,
			Model model ) {
	
		//중개사
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		MemberSearch ms = new MemberSearch(m.getUs_id(),searchCondition,searchValue,"1","1","1","1","1","1","1","1");
		
		System.out.println(page+"/"+m.getUs_id()+"/"+searchCondition+"/"+searchValue);

		int listCount = mService.getEstateAgenListCount(ms);
		
		System.out.println(listCount);
		
		MemberPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<EstateAgent> list = mService.selectEstateAgenList(ms,pi);
		
		System.out.println(list);
		
		if(m.getUs_type().equals("관리자")) {
			model.addAttribute("list", list);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("pi", pi);
		}
		
		return "mypage_brokerManagement";
	}
	
	// 중개사 상세보기
	@RequestMapping("goEstateAgentDetailPage.me")
	public String goMemberDetailPage(
//			@RequestParam("e_id") int e_id, 
//			@RequestParam("us_id") String us_id, 
			@RequestParam(value = "e_id", required = false) int e_id, 
			@RequestParam(value = "us_id", required = false) String us_id, 
			Model model,
			@RequestParam(value = "currentPage", required = false) Integer page,
			@RequestParam(value= "searchCondition",required= false) String searchCondition,
			@RequestParam(value= "searchValue",required= false) String searchValue) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		System.out.println("us_id"+us_id);
		
		EstateAgent ea = mService.selectEstateDetail(us_id);
		Member mb = mService.selectNormalMemberDetail(us_id);
		
		System.out.println("e_id:" + e_id);
		ProductApplicationSearch pas = new ProductApplicationSearch(e_id,searchCondition,searchValue);
		System.out.println("pas: "+pas);
		
		int listCount = paService.getProductApplicationListCount(pas);
		
		System.out.println("listCount: "+listCount);
		
		MemberPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ProductApplication> ProductApplicationList = paService.selectProductApplicationList(pas,pi);
		
		model.addAttribute("list", ProductApplicationList);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("pi", pi);

		model.addAttribute("ea",ea);
		model.addAttribute("mb",mb);
		
		return "mypage_brokerManagement_viewDetails";
	}
	
	// 회원관리페이지에서  중개사 계정삭제
	@RequestMapping("deleteEstateAgent.me")
	public void deleteEstateAgent(@RequestParam("us_id") String us_id, // 선택한 아이디
			@ModelAttribute("loginUser") Member m, 
			HttpServletResponse response,
			@RequestParam(value = "currentPage", required = false) Integer page,
			@RequestParam(value= "searchCondition",required= false) String searchCondition,
			@RequestParam(value= "searchValue",required= false) String searchValue,
			Model model ) throws IOException {
	
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		MemberSearch ms = new MemberSearch(m.getUs_id(),searchCondition,searchValue,"1","1","1","1","1","1","1","1");
		
		System.out.println(page+"/"+m.getUs_id()+"/"+searchCondition+"/"+searchValue);

		int listCount = mService.getEstateAgenListCount(ms);
		
		System.out.println(listCount);
		
		MemberPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<EstateAgent> list = mService.selectEstateAgenList(ms,pi);
		
		System.out.println(list);
		
		if(m.getUs_type().equals("관리자")) {
			model.addAttribute("list", list);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("pi", pi);
		}
		
		int result1 = mService.deleteEstateAgent(us_id);
		
		response.getWriter().print("1");
	}
	
	// 마이페이지 - 중개사 관리 - 상세보기
	@RequestMapping("mypage_brokerManagement_viewDetails.me")
	public String mypage_brokerManagement_viewDetails() {
		return "mypage_brokerManagement_viewDetails";
	}
	
	// 마이페이지-매물 관리
	@RequestMapping("mypage_propertyManagement.me")
	public String mypage_propertyManagement() {
		return "mypage_propertyManagement";
	}
	
	// 마이페이지-예시
	@RequestMapping("mypage_reported.me")
	public String mypage_reported() {
		return "nav";
	}
	
	// 회원가입페이지이동
	@RequestMapping("enrollView.me")
	public String enrollView() {
		return "memberJoin";
	}
		
	
	// 회원가입
	@RequestMapping("minsert.me")
	public String insertMember(@ModelAttribute Member m,
			@RequestParam("us_ssn") String ssn1,
			@RequestParam("post") String post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2) {
		
		m.setUs_addr(post + "/" + address1 + "/" + address2);

		String encPwd = bcryptPasswordEncoder.encode(m.getUs_pwd());
		
		m.setUs_pwd(encPwd);
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:home.do";
		}else {
			throw new MemberException("회원가입에 실패했습니다.");
		}
	}
	
	// 암호화 후 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(Member m, Model model) {
		
		System.out.println(bcryptPasswordEncoder.encode("1234"));
		
		Member loginUser = mService.memberLogin(m);
		
		System.out.println(m.getUs_pwd());
		System.out.println(loginUser.getUs_pwd());
		
		if(bcryptPasswordEncoder.matches(m.getUs_pwd(), loginUser.getUs_pwd())) {
			model.addAttribute("loginUser", loginUser);
			
		}else {
			throw new MemberException("로그인에 실패했습니다.");
		}
		
		return "redirect:home.do";
	}
	
	// 아이디중복확인
	@RequestMapping("dupid.me")
	public void dupId(String id, HttpServletResponse response) throws IOException {
		int result = mService.checkIdDup(id);
		boolean isUsable = mService.checkIdDup(id) == 0 ? true : false;
		
		response.getWriter().print(isUsable);
	}
	
}
