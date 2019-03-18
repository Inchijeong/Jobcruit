package com.jobcruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobcruit.domain.Review;
import com.jobcruit.dto.Criteria;
import com.jobcruit.mappers.ReviewMapper;

import lombok.extern.java.Log;

@Log
@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	

	@Override
	public Review get(Long cid) {
		log.info("get");
		return mapper.read(cid);
	}

	@Override
	public List<Review> getList(Long cid) {
		log.info("review====================getList" + cid);
		return mapper.getlist(cid);
	}

	@Override
	public int getListCount(Criteria cri) {
		return mapper.getTotal(cri);
	}

}
