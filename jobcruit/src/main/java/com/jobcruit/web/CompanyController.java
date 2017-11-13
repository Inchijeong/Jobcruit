package com.jobcruit.web;

import com.jobcruit.domain.Company;
import com.jobcruit.domain.Review;
import com.jobcruit.dto.Criteria;
import com.jobcruit.service.CompanyService;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/company/*")
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private CompanyService service;

	@GetMapping("/register")
	public void registerGet() {
		log.info("registerGET");
	}
	
	@GetMapping("/upload")
	public void uploadGet() {
		log.info("uploadGET");
	}

	@GetMapping("/update")
	public void updateGet(@RequestParam(name = "cid") Long cid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("===============================================update Get" + cid);
		model.addAttribute("company", service.get(cid));
	}

	@GetMapping("/detail")
	public void detail(@RequestParam(name = "cid") Long cid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("===============================================detail Get" + cid);
		model.addAttribute("company", service.get(cid));
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(name = "cid") Long cid, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("===============================================delete Get" + cid);
		service.remove(cid);
		rttr.addFlashAttribute("criteria", cri);
		return "redirect:/job/company/list";
	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("total", service.getListCount(cri));
		log.info("========================================================list" + cri);
	}

	@GetMapping("/page/{page}")
	public ResponseEntity<List<Company>> getList(@PathVariable("page") int pageNum,
			@RequestParam(name = "size", defaultValue = "10") int size) {
		Criteria cri = new Criteria(pageNum, size);
		return new ResponseEntity<List<Company>>(service.getList(cri), HttpStatus.OK);
	}

	@PostMapping("/register")
	public String registerPost(Company company, Criteria cri, RedirectAttributes rttr) {
		log.info("register Post" + company);

		try {
			service.register(company);
		} catch (Exception e) {

		}
		rttr.addFlashAttribute("result", "success");
		rttr.addFlashAttribute("criteria", cri);
		return "redirect:/job/company/list";
	}

	@PostMapping("/update")
	public String updatePost(Company company, Criteria cri, RedirectAttributes rttr) {
		log.info("========================================update Post" + company);
		try {
			service.modify(company);
		} catch (Exception e) {

		}
		rttr.addFlashAttribute("criteria", cri);
		return "redirect:/job/company/list";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public void uploadForm(Long mno, MultipartFile file, Model model) throws Exception{
		logger.info("originName:"+file.getOriginalFilename());
		logger.info("size:"+file.getSize());
		logger.info("content type:"+file.getContentType());
		
		String savedName = uploadFile(mno, file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
	}
//	@RequestMapping(value="/upload", method=RequestMethod.POST)
//	public void uploadForm(MultipartFile file, Long mno, Model model) throws Exception{
//		logger.info("originName:"+file.getOriginalFilename());
//		logger.info("size:"+file.getSize());
//		logger.info("content type:"+file.getContentType());
//		
//		ResponseEntity<String> entity = null;
//		try {
//			entity = new ResponseEntity<String>(uploadFile(mno, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//	}
	
	private String uploadFile(Long mno, String originalName, byte[] fileData) throws Exception{
		String savedName = mno + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
