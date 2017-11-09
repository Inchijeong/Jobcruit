package com.jobcruit.web;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.jobcruit.domain.Member;
import com.jobcruit.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/member/*")
public class MemberController {

	@Autowired
	MemberService service;
	
	@PostMapping("/getName")
	@ResponseBody
	public Member getNamePost(Integer mno) {
		return service.get(mno);
	}
	
	
	// 로그아웃
	@GetMapping("/logout")
	public void logoutGet(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		Object obj = session.getAttribute("mnoSession");
//		log.info("갖고 있던 세션: " + obj.toString());
		if (obj != null) {
			session.removeAttribute("mnoSession");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "mnoCookie");
			
//			log.info("갖고 있던 쿠키: " + loginCookie.getValue());
			
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
//				log.info("삭제 후 쿠키: " + loginCookie.getValue());
				response.addCookie(loginCookie);
			}
		}
		
		response.sendRedirect("/job/member/myPage");
//		log.info("삭제 후 세션: " + session.getAttribute("mnoSession"));
		
	}
	
	// 마이 페이지로 이동
	@GetMapping("/myPage")
	public void myPageGet() {
		
	}
	
	// 아이티 중복 체크
	@PostMapping("/checkID")
	@ResponseBody
	public Integer checkIDPost(String email) {
		return service.checkEmail(email);
	}
	
	
	// 비밀번호 확인 페이지로 이동
	@GetMapping("/checkPassword")
	public void checkPasswordGet() {
		
	}
	
	// 비밀번호 확인 페이지로 이동
	@PostMapping("/checkPassword")
	public void checkPasswordPost() {
		
	}
	
	// 비밀번호 변경 페이지로 이동
	@GetMapping("/editPassword")
	public void editPasswordGet() {
		
	}
	
	// 개인정보 변경 페이지로 이동
	@GetMapping("/editInfo")
	public void editMemberInfoGet() {
		
	}
	
	// 개인정보 변경
	@PostMapping("/editInfo")
	public void editMemberInfoPost(Member vo) {
		service.modify(vo);
	}
	
	// 비번찾기 찾기 페이지로 이동
	@GetMapping("/recover")
	public void recoverGet() {
		
	} 
	
	// 비밀번호 찾기
	@PostMapping("/recover")
	@ResponseBody
	public Integer recoverPost(Member vo) {
		return service.recover(vo);
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public void loginGet() {
		
	}
	
	// 로그인
	@PostMapping("/loginPost")
	public String loginPost(Member vo, Boolean rememberId, Boolean rememberMe, Model model) {
//		log.info(""+ rememberId);
//		log.info(""+ rememberMe);
//		log.info("사용자 :" + service.getLogin(vo));
		
		model.addAttribute("mno", service.getLogin(vo));
		model.addAttribute("rememberId", rememberId);
		model.addAttribute("rememberMe", rememberMe);
		return "redirect:/job/member/myPage";
	}
	
	// 로그인 아이디, 비밀번호 체크
	@PostMapping("/loginCheck")
	@ResponseBody
	public Integer loginCheck(Member vo) {
		return service.getLogin(vo);
	};
	
	
	// 회원가입 페이지로 이동
	@GetMapping("/signUp")
	public void singUpGet() {
		
	} 
	
	// 회원가입
	@PostMapping("/signUpPost")
	public String singUpPost(Member vo) {
		service.register(vo);
		return "redirect:/job/member/myPage";
	}
	
}
