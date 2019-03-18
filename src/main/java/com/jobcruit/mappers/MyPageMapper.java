package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.jobcruit.domain.Cv;
import com.jobcruit.domain.Recruit;

public interface MyPageMapper {
	
	public List<Recruit> getFavList(Integer mno);
	
	@Delete("delete from tb_fav_recruit where rno = #{rno}")
	public void deleteFav(Integer rno);
	
	public void createCv(Cv cv);
	
	public List<Cv> readCvList(Integer mno);
}
