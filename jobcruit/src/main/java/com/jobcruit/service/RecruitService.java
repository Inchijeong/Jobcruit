package com.jobcruit.service;

import java.util.List;

import com.jobcruit.domain.HashTag;
import com.jobcruit.domain.Recruit;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;

public interface RecruitService {
	
	public String register(Recruit recruit, String keyword);
	public void register(Recruit recruit, String files[]);
	public Recruit get(Integer rno);
	
	public void modify(Recruit recruit);
	
	
	/* 관심 채용 등록 및 삭제 */
	public void registerHeart(Recruit recruit);
	public void deleteHeart(Recruit recruit);
	
	
	
	public void remove(Integer rno);
	
	public List<Recruit> getList(Criteria cri);
	
	public List<Recruit> searchList(SearchCriteria scri);
	
	public int getListCount(Criteria cri);
	public int getSearchCount(SearchCriteria scri);
	public String getKeyword(SearchCriteria scri);
}
