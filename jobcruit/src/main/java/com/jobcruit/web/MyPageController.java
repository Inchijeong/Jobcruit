package com.jobcruit.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/myPage")
public class MyPageController {
	
	// 마이 페이지로 이동
	@GetMapping("/myPage")
	public void myPageGet() {
		
	}
	
}
