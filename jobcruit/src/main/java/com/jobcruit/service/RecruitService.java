package com.jobcruit.service;

import java.util.List;

import com.jobcruit.domain.HashTag;
import com.jobcruit.domain.Recruit;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;

public interface RecruitService {
	
	public List<Recruit> getMainList();
	
	public String register(Recruit recruit, String keyword);
//	public void register(Recruit recruit, String files[]);
	public Recruit get(Integer rno);
	
	// 수정
	public void modify(Recruit recruit);
	
	
	/* 관심 채용 등록 및 삭제 */
	public void registerHeart(Recruit recruit);
	public void deleteHeart(Recruit recruit);
	
//	기업 이름 땡겨오기
	public String getCompName(Integer cid);
	
	//삭제
	public void remove(Integer rno);
	
	// 리스트 가져오기
	public List<Recruit> getList(Criteria cri);
	
	// 검색 리스트 가져오기
	public List<Recruit> searchList(SearchCriteria scri);
	// 카운트 세기
	public int getListCount(Criteria cri);
	public int getSearchCount(SearchCriteria scri);
	
	//키워드 검색하기
	public String getKeyword(SearchCriteria scri);
}
