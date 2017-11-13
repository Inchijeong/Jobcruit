package com.jobcruit.service;

import java.util.List;

import com.jobcruit.domain.FreeComment;
import com.jobcruit.dto.Criteria;

public interface FreeCommentService {
	public void register(FreeComment vo) throws Exception;
	public FreeComment detail(Integer key) throws Exception;
	public void modify(FreeComment vo) throws Exception;
	public void remove(Integer key) throws Exception;
	public List<FreeComment> getList(Integer key, Criteria cri) throws Exception;
	public int getListCount(Integer key) throws Exception;
}