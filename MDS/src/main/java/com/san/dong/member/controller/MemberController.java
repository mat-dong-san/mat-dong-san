package com.san.dong.member.controller;

import java.io.IOException;

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

import com.san.dong.member.model.exception.MemberException;
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
	
	// 회원가입페이지이동
	@RequestMapping("enrollView.me")
	public String enrollView() {
		return "memberJoin";
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
