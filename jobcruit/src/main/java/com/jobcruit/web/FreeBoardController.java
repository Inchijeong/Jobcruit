package com.jobcruit.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobcruit.domain.FreeBoard;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;
import com.jobcruit.dto.SearchResult;
import com.jobcruit.service.FreeBoardService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/free/*")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@GetMapping("/list")
	public void list() {
		
	}
	
	@GetMapping("/page")
	@ResponseBody
	public SearchResult<FreeBoard> getList(SearchCriteria cri){
		SearchResult<FreeBoard> result = new SearchResult<FreeBoard>();
		try {
			result.setList(service.getList(cri));
			result.setCri(cri);
			result.setTotal(service.getListCount(cri));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("/register")
	public void registerGet() {
		
	}
	
	@PostMapping("/register")
	public String registerPost(FreeBoard free, RedirectAttributes rttr) {
		try {
			service.register(free);
			rttr.addFlashAttribute("result", "success");
		} catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result", "fail");
		}
		return "redirect:/job/free/list";
	}
	
	@GetMapping("/detail")
	public void detail(int fno, Model model) {
		try {
			model.addAttribute("free", service.detail(fno));
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("free", null);
		}
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public ResponseEntity<String> modify(FreeBoard free) {
		ResponseEntity<String> entity = null;
		try {
			free.setModiDate(new Date());
			service.modify(free);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("/remove")
	@ResponseBody
	public ResponseEntity<String> remove(int fno) {
		ResponseEntity<String> entity = null;
		try {
			service.delete(fno);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}