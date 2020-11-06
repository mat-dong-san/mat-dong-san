package com.san.dong.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.san.dong.member.model.exception.MemberException;
import com.san.dong.member.model.vo.EstateAgent;
import com.san.dong.member.model.vo.Member;
import com.san.dong.member.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
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
	
	// 회원선택페이지이동
	@RequestMapping("enrollView.me")
	public String enrollView() {
		return "selectJoin";
	}
	
	// 회원가입페이지이동
	@RequestMapping("memberJoin.me")
	public String memberJoinView() {
		return "memberJoin";
	
	}
	
	// 중개사가입페이지이동
	@RequestMapping("estateAgentJoin.me")
	public String estateAgentJoinView() {
		return "estateAgentJoin";
	}
	
	// 회원가입
	@RequestMapping("minsert.me")
	public String insertMember(@ModelAttribute Member m,
			@RequestParam("ssn1") String ssn1,
			@RequestParam("ssn2") String ssn2,
			@RequestParam("post") String post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2) {
		
		m.setUs_ssn(ssn1 + "-" +  ssn2);
		m.setUs_addr(post + "/" + address1 + "/" + address2);

		String encPwd = bcryptPasswordEncoder.encode(m.getUs_pwd());
		System.out.println(encPwd);
		
		m.setUs_pwd(encPwd);
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:home.do";
		}else {
			throw new MemberException("회원가입에 실패했습니다.");
		}
		
	}
	
	// 중개사회원가입
	@RequestMapping("einsert.me")
	public String insertEstateAgent(
			@ModelAttribute EstateAgent e, 
			@RequestParam("fileName") MultipartFile fileName,
			HttpServletRequest request,
			@RequestParam("post") String post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam("field") String [] fields
			
			) {
		System.out.println("1");
		e.setE_id(1);
		if(fileName != null && !fileName.isEmpty()) {
			String renameFileName = saveFile(fileName, request);
			
			if(renameFileName != null) {
				e.setE_picture(fileName.getOriginalFilename());
			}
		}
		
		String e_field = "";
		for (int i = 0; i < fields.length;) { 
			
				e_field += fields[i];
	        if (++i < fields.length) { 

	        	e_field += ","; 
	        } 
	    } 
		System.out.println(e_field);
	    
		e.setE_field(e_field);
		e.setE_addr(post + "/" + address1 + "/" + address2);
		
		int result = mService.insertEstateAgent(e);
			
		if(result > 0) {
			return "redirect:home.do";
		}else {
			throw new MemberException("중개사 등록에 실패했습니다.");
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
	
	// 중개사아이디확인
	@RequestMapping("dupid2.me")
	public void dupId2(String id, HttpServletResponse response) throws IOException {
		
		int result = mService.checkIdDup2(id);
		boolean isUsable = mService.checkIdDup2(id) == 0 ? true : false;
		
		response.getWriter().print(isUsable);
	}
	
	// 중개사이름중복확인
	@RequestMapping("dupname.me")
	public void dupName(String name, HttpServletResponse response) throws IOException {			
		
		int result = mService.checkNameDup(name);
		boolean isUsable = mService.checkNameDup(name) == 0 ? true : false;
		
		response.getWriter().print(isUsable);
	}
	
	
}
