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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	
	// 사용자 정보 가져오기
	@PostMapping("/getName")
	@ResponseBody
	public Member getNamePost(Integer mno) {
		return service.get(mno);
	}
	
	// 아이디 중복 체크
	@PostMapping("/checkID")
	@ResponseBody
	public Integer checkIDPost(String email) {
		return service.checkEmail(email);
	}
	
	
	// 비밀번호 확인 페이지로 이동
	@GetMapping("/checkPassword")
	public void checkPasswordGet() {
//		log.info("mno 비번 확인 왔음" + mno);
	}
	
	// 비밀번호 확인
	@PostMapping("/checkPassword")
	@ResponseBody
	public Integer checkPasswordPost(Member member) {
		log.info("--------------체크 후" + service.checkPassword(member));
		return service.checkPassword(member);
//		return service.checkPassword(member) == 0 ? "" : "redirect:/job/member/editInfo";
	}
	
	
	// 비밀번호 변경 페이지로 이동
	@GetMapping("/editPassword")
	public void editPasswordGet(Integer mno, Model model) {
//		log.info("받은 mno" + mno);
		model.addAttribute("mno", mno);
//		rttr.addFlashAttribute("mno", mno);
//		log.info("플래시에 넣은 mno" + rttr.getFlashAttributes().get("mno"));
	}
	
	// 비밀번호 변경 
	@PostMapping("/editPassword")
	public String editPasswordPost(Member member) {
		service.modifyPassword(member);
		return "redirect:/job/common/main?editPassword=success";
	}
	
	// 개인정보 변경 페이지로 이동
	@GetMapping("/editInfo")
	public void editInfoGet() {
		
	}
	
	// 개인정보 변경
	@PostMapping("/editInfo")
	public String editInfoPost(Member member) {
		service.modify(member);
		return "redirect:/job/myPage/myPage?editInfo=success";
	}
	
	// 비번찾기 찾기 페이지로 이동
	@GetMapping("/recover")
	public void recoverGet() {
		
	} 
	
	// 비밀번호 찾기
	@PostMapping("/recoverPost")
	@ResponseBody
	public Integer recoverPost(Member member) {
		return service.recover(member);
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public void loginGet() {
		
	}
	
	// 로그인
	@PostMapping("/loginPost")
	public void loginPost(Member member, Boolean rememberId, Boolean rememberMe, Model model) {
//		log.info(""+ rememberId);
//		log.info(""+ rememberMe);
//		log.info("사용자 :" + service.getLogin(member));
//		log.info("이메일 :" + member.getEmail());
		
		model.addAttribute("mno", service.getLogin(member));
		model.addAttribute("email", member.getEmail());
		model.addAttribute("rememberId", rememberId);
		model.addAttribute("rememberMe", rememberMe);
		
//		log.info("LOGIN POST.............FINISHED");
	}
	
	// 로그인 아이디, 비밀번호 체크
	@PostMapping("/loginCheck")
	@ResponseBody
	public Integer loginCheck(Member member) {
		return service.getLogin(member);
	};
	
	// 로그아웃
	@GetMapping("/logout")
	public String logoutGet(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		Object obj = session.getAttribute("login");
//		log.info("갖고 있던 세션: " + obj.toString());
		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "mnoCookie");
			
//			log.info("갖고 있던 쿠키: " + loginCookie.getValue());
			
			if (loginCookie != null) {
				loginCookie.setPath("/job");
				loginCookie.setMaxAge(0);
//				log.info("삭제 후 쿠키: " + loginCookie.getValue());
				response.addCookie(loginCookie);
			}
		}
		
//		log.info("삭제 후 세션: " + session.getAttribute("login"));
		return "redirect:/job/common/main";
		
	}
	
	// 회원가입 페이지로 이동
	@GetMapping("/signUp")
	public void singUpGet() {
		
	} 
	
	// 회원가입
	@PostMapping("/signUpPost")
	public String singUpPost(Member member) {
		service.register(member);
		return "redirect:/job/member/login?signUp=success";
	}
	
}
