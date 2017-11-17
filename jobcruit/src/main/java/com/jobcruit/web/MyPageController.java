package com.jobcruit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobcruit.domain.Recruit;
import com.jobcruit.service.MyPageService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/myPage")
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	// 마이 페이지로 이동
	@GetMapping("/myPage")
	public void myPageGet() {
		
	}
	
	// 마이 페이지로 이동
	@GetMapping("/cv")
	public void cvGet() {
		
	}
	
	@ResponseBody
	@GetMapping("/favList")
	public List<Recruit> favListGet(Integer mno, Model model) {
		return service.getFavList(mno);
	}
	
	@GetMapping("/removeFav")
	public String favRemoveGet(Integer rno) {
		service.removeFav(rno);
		return "redirect:/job/myPage/myPage?removeFav=success";
	}
	
}
