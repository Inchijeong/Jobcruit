package com.jobcruit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jobcruit.domain.FreeComment;
import com.jobcruit.dto.Criteria;
import com.jobcruit.service.FreeCommentService;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/job/free/comm")
public class FreeCommentController {
	@Autowired
	private FreeCommentService service;
	
	@GetMapping("")
	public ResponseEntity<List<FreeComment>> list(Integer fno, Criteria cri){
		ResponseEntity<List<FreeComment>> entity = null;
		
		try {
			entity = new ResponseEntity<List<FreeComment>>(service.getList(fno, cri), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<String> register(FreeComment comment) {
		ResponseEntity<String> entity = null;
		try {
			service.register(comment);
			entity = new ResponseEntity<>("success",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PutMapping("/{freeCno}")
	public ResponseEntity<String> update(@PathVariable("freeCno")Integer freeCno, @RequestBody FreeComment comment){
		log.info("comment update");
		ResponseEntity<String> entity = null;
		comment.setFreeCno(freeCno);
		try {
			service.modify(comment);
			entity = new ResponseEntity<>("success",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@DeleteMapping("/{freeCno}")
	public ResponseEntity<String> remove(@PathVariable("freeCno") Integer freeCno){
		ResponseEntity<String> entity = null;
		try {
			service.remove(freeCno);
			entity = new ResponseEntity<>("success",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}