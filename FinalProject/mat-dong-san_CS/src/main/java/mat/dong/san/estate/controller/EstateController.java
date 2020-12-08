package mat.dong.san.estate.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import mat.dong.san.estate.common.Pagination;
import mat.dong.san.estate.exception.EstateException;
import mat.dong.san.estate.service.EstateService;
import mat.dong.san.estate.vo.Estate;
import mat.dong.san.estate.vo.Note;
import mat.dong.san.estate.vo.PageInfo;
import mat.dong.san.product.vo.Product;
import mat.dong.san.estate.vo.ProductApplication;
import mat.dong.san.estate.vo.Review;
import mat.dong.san.estate.vo.SearchCondition;
import mat.dong.san.member.vo.Member;
import mat.dong.san.search.service.SearchRoomService;


@SessionAttributes("pSession")
@Controller
public class EstateController {

	@Autowired
	private EstateService eService;
	
	@Autowired
	private SearchRoomService sService;
	
	// 최근본매물 체크박스삭제
	@RequestMapping("deleteCheck.es")
	public void deleteCheck(@RequestParam("selectedCheck[]") List<Integer> selectedCheck, HttpSession session,
			HttpServletResponse response) throws IOException {

		String result = "1";

		ArrayList<Product> view = (ArrayList<Product>) session.getAttribute("pSession");
		if (view == null) {
			view = new ArrayList<Product>();
		}

		for (int i = 0; i < view.size(); i++) {

			for (int j = 0; j < selectedCheck.size(); j++) {
				if (view.get(i).getP_id() == selectedCheck.get(j)) {
					view.remove(i);
				}
			}
		}

		session.setAttribute("pSession", view);

		response.getWriter().print(result);

	}
	
	// 체크박스찜
	@RequestMapping("selectedTakeCheck.es")
	public void selectedTakeCheck(@RequestParam("selectedCheck[]") List<Integer> selectedCheck, HttpSession session,
			HttpServletResponse response) throws IOException {

		String result = "1";
		
		Product product = null;
		
		ArrayList<Product> view = (ArrayList<Product>)session.getAttribute("ptSession");
		
		if (view == null) {
			view = new ArrayList<Product>();
		}

		
		for (int k = 0; k < selectedCheck.size(); k++) {
			
			int cnt = 0;
			product = sService.selectProductRoom(selectedCheck.get(k));
			
			
			for (int j = 0; j < view.size(); j++) {
					
				if (selectedCheck.get(k) == view.get(j).getP_id()) {
					cnt = 1;
				}
					
			}
					
			
			
			if(cnt == 0) {
				
				view.add(product);
			}
		
		}

		session.setAttribute("ptSession", view);

		response.getWriter().print(result);

	}
	
	// 찜한매물 체크박스삭제
	@RequestMapping("deleteTakeCheck.es")
	public void deleteTakeCheck(@RequestParam("selectedCheck[]") List<Integer> selectedCheck, HttpSession session,
			HttpServletResponse response) throws IOException {

		String result = "1";

		ArrayList<Product> view = (ArrayList<Product>) session.getAttribute("ptSession");
		if (view == null) {
			view = new ArrayList<Product>();
		}

		for (int i = 0; i < view.size(); i++) {

			for (int j = 0; j < selectedCheck.size(); j++) {
				if (view.get(i).getP_id() == selectedCheck.get(j)) {
					view.remove(i);
				}
			}
		}

		session.setAttribute("ptSession", view);

		response.getWriter().print(result);

	}
	

	// 매물중개사정보
	@RequestMapping("selectEstate.es")
	public void selectEstate(@RequestParam("p_id") String p_id, HttpSession session, HttpServletResponse response)
			throws IOException {
		response.setContentType("application/json; charset=UTF-8");

		Estate estate = eService.selectEstate(p_id);
		System.out.println(estate);

		JSONObject estateInfo = new JSONObject();
		estateInfo.put("e_id", estate.getE_id());
		estateInfo.put("e_name", estate.getE_name());
		estateInfo.put("e_phone", estate.getE_phone());
		estateInfo.put("e_content", estate.getE_content());
		estateInfo.put("e_addr", estate.getE_addr());
		estateInfo.put("e_picture", estate.getE_picture());
		estateInfo.put("e_field", estate.getE_field());
		estateInfo.put("e_reg_num", estate.getE_reg_num());
		estateInfo.put("e_coord", estate.getE_coord());
		estateInfo.put("e_c_lat", estate.getE_c_lat());
		estateInfo.put("e_c_lng", estate.getE_c_lng());
		estateInfo.put("e_point", estate.getE_point());
		estateInfo.put("e_reg_d", estate.getE_reg_d());
		estateInfo.put("e_del_yn", estate.getE_del_yn());
		estateInfo.put("us_id", estate.getUs_id());

		new Gson().toJson(estateInfo, response.getWriter());

	}

	// 리뷰리스트
	@RequestMapping("estateReview.es")
	public void estateReview(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("e_id") int e_id, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=UTF-8");

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = eService.getReviewCount(e_id);
		
		System.out.println("listCount > " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		System.out.println("pi" + pi);
		
		ArrayList<Review> list = eService.selectReviewList(e_id, pi);

		for (int i = 0; i < list.size(); i++) {
			System.out.println("list>" + list.get(i));
		}

		JSONObject userObj = null;
		JSONArray review = null;
		JSONObject userMap = null;

		review = new JSONArray();
		userMap = new JSONObject();
		for (int i = 0; i < list.size(); i++) {

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

	// 리뷰등록
	@RequestMapping("insertReview.es")
	public void insertReview(@RequestParam("er_content") String er_content, @RequestParam("er_point") int er_point,
			@RequestParam("e_id") int e_id, @RequestParam("us_id") String us_id, HttpSession session,
			HttpServletResponse response) throws IOException {

		int reviewer_count = eService.getReviewCount(e_id);
		int sum_estate_point = eService.getTotalEstatePoint(e_id);

		int result = eService.reviewIdCheck(us_id, e_id);
		if (result > 0) { // 아이디중복
			response.getWriter().print("1");
		} else { // 등록
			float avg = (float) (er_point + sum_estate_point) / (reviewer_count + 1);
			eService.updateEstatePoint(e_id, avg);
			double avg2 = Math.round(avg * 100) / 100.0;
			System.out.println(avg2);
			Review review = new Review();
			review.setE_id(e_id);
			review.setUs_id(us_id);
			review.setEr_point(er_point);
			review.setEr_content(er_content);

			eService.insertReview(review);

			response.getWriter().print(avg2);
		}

	}

	// 리뷰삭제
	@RequestMapping("deleteReview.es")
	public void deleteReview(@RequestParam("er_id") int er_id, @RequestParam("er_point") int er_point,
			@RequestParam("e_id") int e_id, HttpSession session, HttpServletResponse response) throws IOException {

		int result = eService.deleteReview(er_id);

		if (result > 0) {
			int reviewer_count = eService.getReviewCount(e_id);
			int sum_estate_point = eService.getTotalEstatePoint(e_id);
			float avg = (float) (sum_estate_point - er_point) / (reviewer_count - 1);
			double avg2 = Math.round(avg * 100) / 100.0;
			eService.updateEstatePoint(e_id, avg);
			response.getWriter().print(avg2);
		} else {
			response.getWriter().print("0");
		}

	}

	// 쪽지보내기
	@RequestMapping("insertMessage.es")
	public void insertMessage(@RequestParam("us_id") String us_id, @RequestParam("p_id") int p_id,
			@RequestParam("e_id") int e_id, @RequestParam("un_content") String un_content, HttpSession session,
			HttpServletResponse response) throws IOException {

		Note note = new Note();
		note.setE_id(e_id);
		note.setP_id(p_id);
		note.setUs_id(us_id);
		note.setUn_content(un_content);
		int result = eService.insertMessage(note);

		if (result > 0) {
			response.getWriter().print("1");
		} else {
			response.getWriter().print("0");
		}

	}

	// 최근본매물 이동
	@RequestMapping("productRecentList.es")
	public String productRecentList() {
		return "productRecentList";
	}
	// 찜한매물 이동
	@RequestMapping("productTakeList.es")
	public String productTakeList() {
		return "productTakeList";
	}

	// 쪽지 이동
	@RequestMapping("note.es")
	public String note() {
		return "note";
	}

	// 테스트용도
	@RequestMapping("test.es")
	public String test() {
		return "test";
	}


	// 중개사마이페이지 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	// 회원/중개사마이페이지이동
	@RequestMapping("mypageView.es")
	public String mypageView(Model model, HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/";
		}

		if (loginUser.getUs_type().equals("일반")) {
			return "memberMypage";
		} else if (loginUser.getUs_type().equals("중개사")) {
			Estate estate = new Estate();
			estate = eService.selectEstateInfo(loginUser.getUs_id());
			model.addAttribute("e", estate);
			return "estateMypage";
		}
		return "redirect:/";
	}
	
	
	// 중개사정보
	@RequestMapping("selectEstateInfo.es")
	public void selectEstateInfo(HttpSession session, HttpServletResponse response) throws IOException {

		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println(loginUser);
		Estate estate = new Estate();

		int result = eService.checkEstate(loginUser.getUs_id());
		if (result > 0) {
			estate = eService.selectEstateInfo(loginUser.getUs_id());

			JSONObject userObj = null;
			userObj = new JSONObject();
			userObj.put("e_id", estate.getE_id());
			userObj.put("e_name", estate.getE_name());
			userObj.put("e_phone", estate.getE_phone());
			userObj.put("e_content", estate.getE_content());
			userObj.put("e_addr", estate.getE_addr());
			userObj.put("e_picture", estate.getE_picture());
			userObj.put("e_field", estate.getE_field());
			userObj.put("e_reg_num", estate.getE_reg_num());

			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(userObj, response.getWriter());
		} else {
			response.getWriter().print("1");

		}

	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\euploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	// 개인정보업데이트
	@RequestMapping("updateMember.es")
	public void updateMember(
			HttpSession session,
			@RequestParam("us_id") String us_id,
			@RequestParam("us_name") String us_name,
			@RequestParam("us_phone") String us_phone,
			@RequestParam("us_email") String us_email,
			@RequestParam("us_picture") String us_picture,
			@ModelAttribute Member m,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		m.setUs_id(us_id);
		m.setUs_name(us_name);
		m.setUs_phone(us_phone);
		m.setUs_email(us_email);
		m.setUs_picture(us_picture);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		loginUser.setUs_name(m.getUs_name());
		loginUser.setUs_phone(m.getUs_phone());
		loginUser.setUs_email(m.getUs_email());
		loginUser.setUs_picture(m.getUs_picture());
		
		int result = eService.updateMember(m);
		if (result > 0) {
			response.getWriter().print("1");
		} else {
			throw new EstateException("개인정보 업데이트에 실패했습니다.");
		}

	}
	
	// 개인파일업로드
	@RequestMapping(value = "uploadFileMember.es", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> uploadFileMember(@RequestParam("uploadfile") MultipartFile uploadfile, HttpSession session)
			throws IOException {

		Member loginUser = (Member) session.getAttribute("loginUser");

		try {
			// Get the filename and build the local file path (be sure that the
			// application have write permissions on such directory)
			String filename = uploadfile.getOriginalFilename();
			String directory = "C:\\Users\\jstmy\\OneDrive\\문서\\GitHub\\mat-dong-san\\FinalProject\\mat-dong-san_CS\\src\\main\\webapp\\resources\\images\\"
					+ loginUser.getUs_id() + "\\";
			String filepath = Paths.get(directory, filename).toString();

			// Save the file locally
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filepath)));
			stream.write(uploadfile.getBytes());
			stream.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<>(HttpStatus.OK);
	} // method uploadFile

	
	// 회원탈퇴
	@RequestMapping("mdelete.es")
	public String mdelete(HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int result = eService.mdelete(loginUser.getUs_id());
		Estate estate = eService.selectEstateInfo(loginUser.getUs_id());
		int result2 = eService.edelete(estate.getE_id());
		if (result > 0 && result2 > 0) {
			session.removeAttribute("loginUser");
			return "redirect:/";

		} else {

			throw new EstateException("회원탈퇴에 실패했습니다.");
		}

	}	
	
	// 중개사업데이트
	@RequestMapping("updateEstate.es")
	public void updateEstate(
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute Estate e,
			@RequestParam("e_id") int e_id, 
			@RequestParam("e_name") String e_name, 
			@RequestParam("e_phone") String e_phone, 
			@RequestParam("e_content") String e_content, 
			@RequestParam("e_picture") String e_picture, 
			@RequestParam("e_field") String[] e_field, 
			@RequestParam("e_reg_num") String e_reg_num,
			@RequestParam("e_addr") String e_addr, 
			@RequestParam("e_addr2") String e_addr2,
			@RequestParam("e_addr3") String e_addr3) throws IOException {

		e.setE_id(e_id);
		e.setE_name(e_name);
		e.setE_phone(e_phone);
		e.setE_content(e_content);
		e.setE_picture(e_picture);
		String e_field2 = "";
		
		for (int i = 0; i < e_field.length;) {
			e_field2 += e_field[i];
			if (++i < e_field.length) {
				e_field2 += ",";
			}
		}
		
		e.setE_field(e_field2);
		e.setE_content(e_content.replace("\r\n", "<br>"));
		e.setE_reg_num(e_reg_num);
		e.setE_addr(e_addr + "/" + e_addr2 + "/" + e_addr3);
		int result = eService.updateEstate(e);
		if (result > 0) {
			response.getWriter().print("1");
		} else {
			throw new EstateException("중개사 업데이트에 실패했습니다.");
		}

	}

	// 중개사파일업로드
	@RequestMapping(value = "uploadFileEstate.es", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> uploadFileEstate(@RequestParam("uploadfile2") MultipartFile uploadfile, HttpSession session)
			throws IOException {

		Member loginUser = (Member) session.getAttribute("loginUser");

		try {
			// Get the filename and build the local file path (be sure that the
			// application have write permissions on such directory)
			String filename = uploadfile.getOriginalFilename();
			String directory = "C:\\Users\\jstmy\\OneDrive\\문서\\GitHub\\mat-dong-san\\FinalProject\\mat-dong-san_CS\\src\\main\\webapp\\resources\\images\\"
					+ loginUser.getUs_id() + "\\";
			String filepath = Paths.get(directory, filename).toString();

			// Save the file locally
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filepath)));
			stream.write(uploadfile.getBytes());
			stream.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<>(HttpStatus.OK);
	} // method uploadFile

	// 중개사탈퇴
	@RequestMapping("edelete.es")
	public String edelete(@RequestParam("e_id") int e_id) {
		System.out.println(e_id);
		int result = eService.edelete(e_id);
		if (result > 0) {
			return "estateMypage";
		} else {
			throw new EstateException("중개사 탈퇴에 실패했습니다.");
		}

	}

	// 연락한회원페이지이동
	@RequestMapping("estateMypageContacted.es")
	public String EstateMypageContacted(@RequestParam(value = "currentPage", required = false) Integer page,
			HttpSession session, Model model) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		Member loginUser = (Member) session.getAttribute("loginUser");
		Estate estate = new Estate();

		int result = eService.checkEstate(loginUser.getUs_id());

		if (result > 0) {

			estate = eService.selectEstateInfo(loginUser.getUs_id());

			System.out.println("e_id" + estate.getE_id());

			int listCount = eService.getNoteCount(estate.getE_id());

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			ArrayList<Note> list = eService.selectNoteList(estate.getE_id(), pi);
			System.out.println("list>" + list);

			model.addAttribute("list", list);
			model.addAttribute("e", estate);
			model.addAttribute("pi", pi);
			return "estateMypageContacted";
		} else {
			model.addAttribute("e", "1");
			return "estateMypageContacted";
		}

	}

	// 쪽지검색
	@RequestMapping("searchNote.es")
	public String searchNote(@RequestParam(value = "currentPage", required = false) Integer page,
			@RequestParam("searchCondition") String condition, @RequestParam("searchValue") String value,
			HttpSession session, Model model) {

		SearchCondition sc = new SearchCondition();
		if (condition.equals("us_name")) {
			sc.setUs_name(value);
		} else if (condition.equals("p_id")) {
			sc.setP_id(value);
		}

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		Member loginUser = (Member) session.getAttribute("loginUser");
		Estate estate = new Estate();

		int result = eService.checkEstate(loginUser.getUs_id());

		if (result > 0) {
			estate = eService.selectEstateInfo(loginUser.getUs_id());
			int listCount = eService.getSearchNoteListCount(sc, estate.getE_id());
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			ArrayList<Note> list = eService.selectSearchNoteList(sc, pi, estate.getE_id());

			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("e", estate);
			model.addAttribute("searchCondition", condition);
			model.addAttribute("searchValue", value);
			return "estateMypageContacted";
		} else {
			model.addAttribute("e", "1");
			return "estateMypageContacted";
		}

	}
	
	// 매물관리/신청 이동
	@RequestMapping("estateMypageProperty.es")
	public String estateMypageProperty(
			@RequestParam(value = "currentPage", required = false) Integer page,
			HttpSession session, 
			Model model) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		Estate estate = new Estate();

		int result = eService.checkEstate(loginUser.getUs_id());

		if (result > 0) {
			estate = eService.selectEstateInfo(loginUser.getUs_id());
			int listCount = eService.getPropertyListCount(estate.getE_id());
				
			System.out.println(listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			
			ArrayList<ProductApplication> list = eService.selectPropertyList(estate.getE_id(), pi);
			
			
			model.addAttribute("list", list);
			model.addAttribute("e", estate);
			model.addAttribute("pi", pi);
			return "estateMypageProperty";
		}else {
			model.addAttribute("e", "1");
			return "estateMypageProperty";
		}
		
	}	
	
	
	// 매물관리검색
	@RequestMapping("searchProperty.es")
	public String searchProperty(@RequestParam(value = "currentPage", required = false) Integer page,
			@RequestParam("searchCondition") String condition, @RequestParam("searchValue") String value,
			HttpSession session, Model model) {
		
		SearchCondition sc = new SearchCondition();
		if (condition.equals("p_id")) {
			sc.setP_id(value);
		} else if (condition.equals("p_field")) {
			sc.setP_field(value);
		} else if (condition.equals("p_kind")) {
			sc.setP_kind(value);
		}
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		Estate estate = new Estate();

		int result = eService.checkEstate(loginUser.getUs_id());

		if (result > 0) {
			estate = eService.selectEstateInfo(loginUser.getUs_id());
			int listCount = eService.getSearchPropertyListCount(sc, estate.getE_id());
				
			System.out.println(listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			
			ArrayList<ProductApplication> list = eService.selectSearchPropertyList(sc, pi, estate.getE_id());
			
			model.addAttribute("list", list);
			model.addAttribute("e", estate);
			model.addAttribute("pi", pi);
			model.addAttribute("searchCondition", condition);
			model.addAttribute("searchValue", value);
			return "estateMypageProperty";
		}else {
			model.addAttribute("e", "1");
			return "estateMypageProperty";
		}

	}
	
	
	// 관리취소
	@RequestMapping("cancelProperty.es")
	public void cancelProperty(
			@RequestParam("a_id") int a_id,
			@RequestParam("p_id") int p_id,
			HttpServletResponse response) throws IOException {
		
		int result = eService.cancelProductApplication(a_id);
		int result2 = eService.cancelProduct(p_id);
		
		if(result > 0 && result2 > 0) {
			response.getWriter().print("1");
		}else {
		}
		
	}
	
	// 매물신청리스트
	@RequestMapping("estateApplication.es")
	public void estateApplication(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("searchCondition") String condition, 
			@RequestParam("searchValue") String value,
			HttpSession session,
			HttpServletResponse response) throws IOException {
		
		SearchCondition sc = new SearchCondition();
		if (condition.equals("p_id")) {
			sc.setP_id(value);
		} else if (condition.equals("p_field")) {
			sc.setP_field(value);
		} else if (condition.equals("p_kind")) {
			sc.setP_kind(value);
		}
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		Member loginUser = (Member) session.getAttribute("loginUser");

		Estate estate = new Estate();

		int result = eService.checkEstate(loginUser.getUs_id());
		if (result > 0) {
			estate = eService.selectEstateInfo(loginUser.getUs_id());
			
			
			int listCount = eService.getSearchProductApplicationListCount(sc, estate.getE_id());
			
			System.out.println(listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<ProductApplication> list = eService.selectSearchProductApplicationList(sc, pi, estate.getE_id());
			
			JSONObject userObj = null;
			JSONArray estateApplication = new JSONArray();
			JSONObject userMap = null;
			userMap = new JSONObject();
			userMap.put("estate", estate);
			for(int i = 0; i < list.size(); i++) {
				userObj = new JSONObject();
				userObj.put("a_id", list.get(i).getA_id());
				userObj.put("a_status", list.get(i).getA_status());
				userObj.put("a_date", list.get(i).getA_date());
				userObj.put("p_id", list.get(i).getP_id());
				userObj.put("pr_id", list.get(i).getPr_id());
				userObj.put("e_id", list.get(i).getE_id());
				userObj.put("p_addr", list.get(i).getP_addr());
				userObj.put("p_field", list.get(i).getP_field());
				userObj.put("p_floor", list.get(i).getP_floor());
				userObj.put("p_size", list.get(i).getP_size());
				userObj.put("p_str", list.get(i).getP_str());
				userObj.put("p_kind", list.get(i).getP_kind());
				userObj.put("p_room", list.get(i).getP_room());
				userObj.put("p_s_size", list.get(i).getP_s_size());
				userObj.put("p_d_size", list.get(i).getP_d_size());
				userObj.put("p_layer", list.get(i).getP_layer());
				userObj.put("p_deal", list.get(i).getP_deal());
				userObj.put("p_charter", list.get(i).getP_charter());
				userObj.put("p_rent", list.get(i).getP_rent());
				userObj.put("p_deposit", list.get(i).getP_deposit());
				userObj.put("p_cost", list.get(i).getP_cost());
				userObj.put("p_cost_item", list.get(i).getP_cost_item());
				userObj.put("p_en_d", list.get(i).getP_en_d());
				userObj.put("p_content", list.get(i).getP_content());
				userObj.put("p_heat", list.get(i).getP_heat());
				userObj.put("p_dir", list.get(i).getP_dir());
				userObj.put("p_park", list.get(i).getP_park());
				userObj.put("p_elevator", list.get(i).getP_elevator());
				userObj.put("p_verandar", list.get(i).getP_verandar());
				userObj.put("p_pet", list.get(i).getP_pet());
				userObj.put("p_built_in", list.get(i).getP_built_in());
				userObj.put("p_loan", list.get(i).getP_loan());
				userObj.put("p_option", list.get(i).getP_option());
				userObj.put("p_picture", list.get(i).getP_picture());
				userObj.put("p_reg_d", list.get(i).getP_reg_d());
				userObj.put("p_reg_status", list.get(i).getP_reg_status());
				userObj.put("p_del_yn", list.get(i).getP_del_yn());
				userObj.put("us_id", list.get(i).getUs_id());
				userObj.put("us_name", list.get(i).getUs_name());
				userObj.put("us_phone", list.get(i).getUs_phone());
				userObj.put("us_email", list.get(i).getUs_email());
				userObj.put("us_picture", list.get(i).getUs_picture());
				
				estateApplication.add(userObj);
				userMap.put("estateApplication", estateApplication);
				
			}
			userObj = new JSONObject();
			userObj.put("listCount", pi.getListCount());
			userObj.put("currentPage", pi.getCurrentPage());
			userObj.put("pageLimit", pi.getPageLimit());
			userObj.put("boardLimit", pi.getBoardLimit());
			userObj.put("maxPage", pi.getMaxPage());
			userObj.put("startPage", pi.getStartPage());
			userObj.put("endPage", pi.getEndPage());
			userMap.put("pi", userObj);

			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(userMap, response.getWriter());
		} else {
			response.getWriter().print("1");

		}

	}	
	
	
	// 신청수락
	@RequestMapping("acceptApplication.es")
	public void acceptApplication(
			@RequestParam("a_id") int a_id,
			@RequestParam("p_id") int p_id,
			HttpServletResponse response) throws IOException {
		
		int result = eService.acceptProductApplication(a_id);
		int result2 = eService.registProduct(p_id);
		
		if(result > 0 && result2 > 0) {
			response.getWriter().print("1");
		}else {
		}
		
	}	
	
	// 신청취소
	@RequestMapping("cancelApplication.es")
	public void cancelApplication(
			@RequestParam("a_id") int a_id,
			@RequestParam("p_id") int p_id,
			HttpServletResponse response) throws IOException {
		
		int result = eService.cancelProductApplication(a_id);
		int result2 = eService.cancelProduct(p_id);
		
		if(result > 0 && result2 > 0) {
			response.getWriter().print("1");
		}else {
		}
		
	}	
	
	
	

}
