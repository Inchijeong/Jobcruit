package com.jobcruit.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/common")
public class CommonController {

	@GetMapping("/main")
	public void mainGet() {
		
	}
	
}
