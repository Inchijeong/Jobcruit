package com.jobcruit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobcruit.domain.Review;
import com.jobcruit.dto.Criteria;
import com.jobcruit.service.ReviewService;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/job/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<Review>> list(Long cid) {
		log.info("============================ review list");
		ResponseEntity<List<Review>> entity = null;
		try {
			entity = new ResponseEntity<List<Review>>(service.getList(cid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Review>>(HttpStatus.BAD_REQUEST);
		}
		log.info("======================================================== review list : " + cid);
		
		return entity;
	}
}
