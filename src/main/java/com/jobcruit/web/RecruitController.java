package com.jobcruit.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobcruit.domain.HashTag;
import com.jobcruit.domain.Recruit;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;
import com.jobcruit.service.RecruitService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/recruit/*")
public class RecruitController {
	
	@Autowired
	private RecruitService service;
	 
	@GetMapping("/register")//model -> request setAttribute
	public void registerGET(Criteria cri, Integer cid) {
	
	}
	
	@ResponseBody
	@GetMapping("/heart")//model -> request setAttribute
	public void registerHeart(Recruit recruit, HttpServletRequest request) {
		log.info("111111111"+request.getSession().getAttribute("login"));
		Integer mno = (Integer) request.getSession().getAttribute("login");
		service.registerHeart(recruit.getRno(), mno);
	}
	
	@ResponseBody
	@GetMapping("/heartCancel")//model -> request setAttribute
	public void deleteHeart(Recruit recruit, HttpServletRequest request) {
		Integer mno = (Integer) request.getSession().getAttribute("login");
		service.deleteHeart(recruit.getRno(), mno);
	}
	
//	상세보기
	@GetMapping("/detail")
	public void detail(int rno, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("recruit", service.get(rno));
	}

//	리스트 뿌려주기.
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("criteria", cri);
		model.addAttribute("total", service.getListCount(cri));
	}
	
	
//	디테일에서 수정버튼 눌렀을 때
	@PostMapping("/edit")
	public void editGET(Recruit recruit) {
		
	}
	
//	수정화면에서 저장하기 눌렀을 때
	@GetMapping("/edit")
	public String editSave(Recruit recruit) {
		log.info("1111111111"+recruit);
		log.info("수정 포스트 호출!!!");
		service.modify(recruit);
		return "redirect:/job/recruit/detail?rno="+recruit.getRno();
		
	}
	
	
//	검색했을 때 검색어가 있는 리스트 뿌려주기 scri에 키워드 들어있고 나중에 Criteria빼보기
	@GetMapping("/searchlist")
	public void searchlist(SearchCriteria scri, Model model, Criteria cri) {
		model.addAttribute("cri", cri);
		model.addAttribute("scri", scri);
		model.addAttribute("list", service.searchList(scri));
		model.addAttribute("total", service.getSearchCount(scri));
		//model.addAttribute("keyword", service.getKeyword(scri));
	}
	
//	키워드랑 채용공고 같이 등록하기.
	@PostMapping("/register")
	public String registerPost(HashTag hash, Recruit recruit, Criteria cri, RedirectAttributes rttr) {
		
		String keyword = hash.getKeyword();
		String result = service.register(recruit, keyword);
		rttr.addFlashAttribute("result", result );
		
		rttr.addFlashAttribute("criteria", cri);
		
		return "redirect:/job/recruit/list";
	}
	
//	삭제
	@GetMapping("/delete")
	public String delete (Recruit recruit){
		service.remove(recruit.getRno());
		return "redirect:/job/recruit/list";
		
	}
	
	
	
}
