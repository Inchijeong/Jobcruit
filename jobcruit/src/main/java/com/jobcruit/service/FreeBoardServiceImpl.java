package com.jobcruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jobcruit.domain.FreeAttach;
import com.jobcruit.domain.FreeBoard;
import com.jobcruit.dto.SearchCriteria;
import com.jobcruit.mappers.AttachMapper;
import com.jobcruit.mappers.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	@Autowired
	private FreeBoardMapper mapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Override
	public void register(FreeBoard vo, String files[]) throws Exception {
		mapper.create(vo);
		if(files != null) {
			for(int i=0; i<files.length;i++) {
				attachMapper.addFreeAttach(vo.getFno(), files[i]);
			}
		}
	}

	@Transactional
	@Override
	public FreeBoard detail(Integer key) throws Exception {
		mapper.updateReadCount(key);
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
	
	public List<FreeAttach> getAttach(Integer key) throws Exception {
		return attachMapper.getFreeAttach(key);
	}
}