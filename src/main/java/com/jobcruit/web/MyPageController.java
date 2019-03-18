package com.jobcruit.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jobcruit.domain.Cv;
import com.jobcruit.domain.Recruit;
import com.jobcruit.service.MyPageService;
import com.jobcruit.util.MediaUtils;
import com.jobcruit.util.UploadFileUtils;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/myPage")
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	/*
	// 이력서 등록(iframe)
	@PostMapping("/cv")
	public String cvPost(MultipartFile file, Model model) throws Exception{
		log.info("파일 원본 이름: " + file.getOriginalFilename());
		log.info("사이즈: " + file.getSize());
		log.info("타입: " + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		return "job/myPage/uploadResult";
	}
	*/

	// 이력서 등록(ajax)
	@ResponseBody
	@PostMapping(value="/upload", produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> cvPost(MultipartFile file) throws Exception{
		
		return
			new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadPath,
							file.getOriginalFilename(),
							file.getBytes()),
					HttpStatus.CREATED);
		
	}
	
	// 업로드한 파일 보여주기
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
//		log.info("파일 원본 이름: " + file.getOriginalFilename());
//		log.info("사이즈: " + file.getSize());
//		log.info("타입: " + file.getContentType());
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				
				fileName = fileName.substring(fileName.indexOf("_") +1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
				  new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
				
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		
		return entity;
	}
	
	// uuid 추가
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName =uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	// 파일업로드 취소
	@ResponseBody
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	// 이력서 등록
	@PostMapping("/cvRegister")
	public ResponseEntity<String> cvRegister(Cv cv){
		service.registerCv(cv);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 이력서 등록 페이지로 이동
	@GetMapping("/cv")
	public void cvGet() {
		
	}
	
	// 이력서 리스트 불러오기
	@GetMapping("/cvList")
	@ResponseBody
	public List<Cv> getCvList(Integer mno, Model model) {
		return service.getCvList(mno);
	}
	
	
	// 마이 페이지로 이동
	@GetMapping("/myPage")
	public void myPageGet() {
		
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
