package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import com.jobcruit.domain.Review;
import com.jobcruit.dto.Criteria;

public interface ReviewMapper extends CRUDMapper<Review, Long> {
	@Select("select * from tb_review where cid = #{cid}")
	public List<Review> getlist(@Param(value="cid") Long cid);
	
	@Select("select count(cid) from tb_company")
	public int getTotal(Criteria cri);
}
