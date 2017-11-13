package com.jobcruit.service;

import java.util.List;

import com.jobcruit.domain.Recruit;

public interface MyPageService {

	public List<Recruit> getFavList(Integer mno);
	public void removeFav(Integer rno);
}
