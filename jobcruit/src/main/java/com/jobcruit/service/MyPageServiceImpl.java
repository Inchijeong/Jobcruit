package com.jobcruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobcruit.domain.Recruit;
import com.jobcruit.mappers.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper mapper;

	@Override
	public List<Recruit> getFavList(Integer mno) {
		return mapper.getFavList(mno);
	}

	@Override
	public void removeFav(Integer rno) {
		mapper.deleteFav(rno);
	}


	
	
	
}
