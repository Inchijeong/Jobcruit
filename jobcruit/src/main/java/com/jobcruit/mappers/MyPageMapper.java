package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.jobcruit.domain.Recruit;

public interface MyPageMapper {
	
	public List<Recruit> getFavList(Integer mno);
	
	@Delete("delete from tb_fav_recruit where rno = #{rno}")
	public void deleteFav(Integer rno);
}
