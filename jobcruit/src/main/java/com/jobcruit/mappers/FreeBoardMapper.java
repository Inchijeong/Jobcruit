package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.jobcruit.domain.FreeAttach;
import com.jobcruit.domain.FreeBoard;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;

public interface FreeBoardMapper extends CRUDMapper<FreeBoard, Integer> {
	public List<FreeBoard> getList(SearchCriteria cri);

	public int getListCount(SearchCriteria cri);
	
	public void updateReadCount(Integer key);
}