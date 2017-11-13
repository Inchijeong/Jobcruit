package com.jobcruit.web;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobcruit.dto.Criteria;
import com.jobcruit.service.RecruitService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/common")
public class CommonController {

	@Autowired
	private RecruitService service; 
	
	@GetMapping("/main")
	public void mainGet(Model model) {
			//		리스트 뿌려주기.
			model.addAttribute("list", service.getMainList());
			log.info("11111111111111111"+service.getMainList());
			
	}
	
	@GetMapping(value="/display", produces="image/jpeg")
	@ResponseBody
	public byte[] display(String name) {
		
		try {
			
			FileInputStream in = new FileInputStream("C:\\logo\\" + name);
			ByteArrayOutputStream bas = new ByteArrayOutputStream();
			
			FileCopyUtils.copy(in, bas);
			
			return bas.toByteArray();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
	

