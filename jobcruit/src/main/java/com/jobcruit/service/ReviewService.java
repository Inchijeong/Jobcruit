package com.jobcruit.service;

import java.util.List;
import com.jobcruit.domain.Review;
import com.jobcruit.dto.Criteria;

public interface ReviewService {
	public Review get(Long tno);
	public List<Review> getList(Long tno);
	public int getListCount(Criteria cri);
}
