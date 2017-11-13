package com.jobcruit.service;

import java.util.List;

import com.jobcruit.domain.FreeBoard;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;

public interface FreeBoardService {
	public void register(FreeBoard vo) throws Exception;
	public FreeBoard detail(Integer key) throws Exception;
	public void modify(FreeBoard vo) throws Exception;
	public void delete(Integer key) throws Exception;
	public List<FreeBoard> getList(SearchCriteria cri) throws Exception;
	public int getListCount(SearchCriteria cri) throws Exception;
}