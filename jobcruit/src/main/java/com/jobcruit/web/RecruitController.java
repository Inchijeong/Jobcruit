package com.jobcruit.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.UUID;

import javax.imageio.ImageIO;

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
@RequestMapping("/job/*")
public class RecruitController {
	
	@Autowired
	private RecruitService service;
	
	@GetMapping("/recruit/register")//model -> request setAttribute
	public void registerGET(Criteria cri) {
		
	}
	
	@ResponseBody
	@GetMapping("/recruit/heart")//model -> request setAttribute
	public void registerHeart(Recruit recruit) {
		log.info("11111111111"+recruit.getRno());
		service.registerHeart(recruit);
	}
	
	@ResponseBody
	@GetMapping("/recruit/heartCancel")//model -> request setAttribute
	public void deleteHeart(Recruit recruit) {
		service.deleteHeart(recruit);
	}
	
	
	@GetMapping("/recruit/detail")
	public void detail(@RequestParam(name="rno")int rno, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("recruit", service.get(rno));
	}
	
	@GetMapping("/recruit/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("total", service.getListCount(cri));
		log.info(""+cri);
	}
	
	@GetMapping("/recruit/searchlist")
	public void searchlist(SearchCriteria scri, Model model, Criteria cri) {
		log.info("keyword : "+scri.getKeyword());
		scri.setKeyword(scri.getKeyword().replaceAll(" ", "','"));
		log.info("ddddddddddddd"+ scri.getKeyword());
		model.addAttribute("cri", cri);
		model.addAttribute("scri", scri);
		model.addAttribute("list", service.searchList(scri));
		model.addAttribute("total", service.getSearchCount(scri));
		//model.addAttribute("keyword", service.getKeyword(scri));
		log.info("------ARJGNAEKHNGOAN--------"+service.getKeyword(scri));
		log.info(""+cri);
	}
	
	@PostMapping("/recruit/register")
	public String registerPost(HashTag hash, Recruit recruit, Criteria cri, RedirectAttributes rttr) {
		log.info("``````````````"+ recruit.getPrefer());
		String keyword = hash.getKeyword();
		log.info("*******************************"+keyword);
		String result = service.register(recruit, keyword);
		rttr.addFlashAttribute("result", result );
		rttr.addFlashAttribute("criteria", cri);
		
		return "redirect:/job/recruit/list";
	}
	
	
	/*public String registerFormPost(Recruit recruit, String[] files) {
		
		log.info("recruit : " + recruit);
		log.info("files : " + Arrays.toString(files));
		
		service.register(recruit, files);
		
		return "";
	}*/
	
	/*@PostMapping("/recruit/register")
	public String ex1Post(MultipartFile f1, Model model, Recruit recruit, String[] files) {
		//model에 upload된 파일의 이름을 담아서 보내자.
		//파일의 이름을 알아야 어떤 파일이 업로드 된지 알기 때문!
		log.info("`````recruit : " + recruit);
		log.info("`````files : " + Arrays.toString(files));
		service.register(recruit, files);
		log.info(f1.getOriginalFilename());
		log.info(f1.getContentType());
		log.info(""+f1.getSize());
		
				String uuid = UUID.randomUUID().toString();
				String uploadName = uuid + "_" + f1.getOriginalFilename();
				model.addAttribute("uploadName", uploadName);
				try {
					OutputStream out = new FileOutputStream("C:\\zzz\\"+uploadName);
					FileCopyUtils.copy(f1.getInputStream(), out);
					if(f1.getContentType().startsWith("image")) {
						model.addAttribute("isImage",f1.getContentType().startsWith("image"));
						makeThumbnail(uploadName);
						//thumnail image
					}
				
					
				} catch (Exception e) {
					log.warning(e.getMessage());
				}
				return "/upload/result";
			
		}*/
	private String makeThumbnail(String fileName)throws Exception{
        
		  BufferedImage sourceImg = 
		      ImageIO.read(new File("C:\\zzz\\", fileName));
		  
		  BufferedImage destImg = 
		      Scalr.resize(sourceImg, 
		          Scalr.Method.AUTOMATIC, 
		          Scalr.Mode.FIT_TO_HEIGHT,100);
		  
		  String thumbnailName = 
				  "C:\\zzz" + File.separator +"s_"+ fileName;
		  
		  File newFile = new File(thumbnailName);
		  String formatName = 
		      fileName.substring(fileName.lastIndexOf(".")+1);
		  
		  
		  ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		  log.info(thumbnailName);
		  return thumbnailName;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
