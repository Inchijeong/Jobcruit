package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jobcruit.domain.FreeComment;
import com.jobcruit.dto.Criteria;

public interface FreeCommentMapper extends CRUDMapper<FreeComment, Integer> {
	public List<FreeComment> getList(@Param("fno") Integer fno, @Param("cri") Criteria cri);
	public int getListCount(Integer fno);
	public void plusCommentCount(Integer fno);
	public void minusCommentCount(Integer freeCno);
}