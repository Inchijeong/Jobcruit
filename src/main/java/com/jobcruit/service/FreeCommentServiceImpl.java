package com.jobcruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jobcruit.domain.FreeComment;
import com.jobcruit.dto.Criteria;
import com.jobcruit.mappers.FreeCommentMapper;

@Service
public class FreeCommentServiceImpl implements FreeCommentService {
	@Autowired
	private FreeCommentMapper mapper;
	
	@Transactional
	@Override
	public void register(FreeComment vo) throws Exception {
		mapper.create(vo);
		mapper.plusCommentCount(vo.getFno());
	}
	
	
	@Override
	public FreeComment detail(Integer key) throws Exception {
		return mapper.read(key);
	}

	@Override
	public void modify(FreeComment vo) throws Exception {
		mapper.update(vo);
	}
	
	@Transactional
	@Override
	public void remove(Integer key) throws Exception {
		mapper.minusCommentCount(key);
		mapper.delete(key);
	}

	@Override
	public List<FreeComment> getList(Integer key, Criteria cri) throws Exception {
		return mapper.getList(key, cri);
	}

	@Override
	public int getListCount(Integer key) throws Exception {
		return mapper.getListCount(key);
	}
}