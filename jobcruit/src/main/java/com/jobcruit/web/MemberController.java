package com.jobcruit.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobcruit.domain.Member;
import com.jobcruit.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/member/*")
public class MemberController {

	@Autowired
	MemberService service;
	
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
	public String loginPost(String email, String password, @RequestParam Boolean rememberMe, Model model) {
		log.info(""+email);
		log.info(""+rememberMe);
		model.addAttribute("email", email);
		model.addAttribute("remember", rememberMe);
		return "redirect:/job/member/main";
	}
	
	// 회원가입 페이지로 이동
	@GetMapping("/signUp")
	public void singUpGet() {
		
	} 
	
	// 회원가입
	@PostMapping("/signUpPost")
	public String singUpPost(Member vo) {
		service.register(vo);
		return "redirect:/job/member/main";
	}
	
	// 메인
	@GetMapping("/main")
	public void mainGet() {
		
	}
	
}
