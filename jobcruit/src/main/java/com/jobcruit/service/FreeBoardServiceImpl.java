package com.jobcruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobcruit.domain.FreeBoard;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;
import com.jobcruit.mappers.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	@Autowired
	private FreeBoardMapper mapper;
	
	@Override
	public void register(FreeBoard vo) throws Exception {
		mapper.create(vo);
	}

	@Override
	public FreeBoard detail(Integer key) throws Exception {
		return mapper.read(key);
	}

	@Override
	public void modify(FreeBoard vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public void delete(Integer key) throws Exception {
		mapper.delete(key);
	}

	@Override
	public List<FreeBoard> getList(SearchCriteria cri) throws Exception {
		return mapper.getList(cri);
	}

	@Override
	public int getListCount(SearchCriteria cri) throws Exception {
		return mapper.getListCount(cri);
	}

	@Override
	public List<FreeBoard> getSearchList(SearchCriteria cri) {
		return mapper.getSearchList(cri);
	}
}