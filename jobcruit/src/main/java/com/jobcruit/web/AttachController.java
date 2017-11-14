package com.jobcruit.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/job/upload")
public class AttachController {
	private static final String ATT_ROOT = "D:\\FileUpload\\";
	
	@PostMapping("/{mdir}")
	public String freePost(@PathVariable("mdir") String mDir, MultipartFile mf, Model model) {	//model은 view쪽으로 데이터를 전달하는 카트
		log.info("=========================================");
		log.info(""+mDir);
		log.info(mf.getOriginalFilename());
		log.info(mf.getContentType());
		log.info(""+mf.getSize());
		log.info("=========================================");
		
		String uuid = UUID.randomUUID().toString();	//업로드 시 고유한 파일명
		String uploadName = uuid + "_" + mf.getOriginalFilename();
		
		model.addAttribute("uploadName", uploadName);
		
		try {
			OutputStream out = new FileOutputStream(ATT_ROOT + mDir +"\\"+ uploadName);
			FileCopyUtils.copy(mf.getInputStream(), out);
			
			if(mf.getContentType().startsWith("image")) {
				//model.addAttribute("isImage", f1.getContentType().startsWith("image"));
				model.addAttribute("isImage", true);
				//thumbnail image 생성
				//makeThumbnail(uploadName, mDir);
			}
		} catch(Exception e) {
			log.warning(e.getMessage());
		}
		
		return "/job/upload/result";
	}
	

	private String makeThumbnail(String fileName, String mDir)throws Exception{
		String uploadPath = ATT_ROOT +mDir;
  
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath, fileName));
	
		BufferedImage destImg = null;
		//img height가 width보다 크면 resize 옵션 다르게 처리해주기. 이대로 처리하면 사진이 회전함
		if(sourceImg.getHeight() <= sourceImg.getWidth()) {
			destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);	//height를 100으로 맞춰줌
		} else {
			destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);	//height를 100으로 맞춰줌
		}
		String thumbnailName = uploadPath + File.separator +"s_"+ fileName;	//s_는 썸네일 구분용. 없으면 일반 파일.
	  
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	  
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		log.info(thumbnailName);
		return thumbnailName;
	}
	
	@GetMapping("/delFile/{mdir}")
	@ResponseBody
	public String delFile(@PathVariable("mdir")String mDir, String name) {
		log.info("=================================");
		log.info("mdir : " + mDir);
		log.info("delFile : "+ name);
		log.info("=================================");
		try {
			File file = new File(ATT_ROOT + mDir+"\\"+name);
			if(file.exists()) {
				file.delete();
				return "success";
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	@GetMapping("/download/{mdir}")
	@ResponseBody
	public ResponseEntity<byte[]> downloadFile(@PathVariable("mdir")String mDir, String name) {
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		log.info("download");
		String fileName = name.substring(37);
		log.info(fileName);
		try {
			InputStream in = new FileInputStream(ATT_ROOT+mDir+"\\"+name);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			
			IOUtils.copy(in, bos);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition", "attachment; filename=\""+
	        	//new String(fileName.getBytes(), "ISO-8859-1")+"\"");
	          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			
	        result = new ResponseEntity<byte[]>(bos.toByteArray(), headers, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
}
