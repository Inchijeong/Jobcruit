package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jobcruit.domain.Recruit;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;

public interface RecruitMapper extends CRUDMapper<Recruit, Integer> {
	
	@Select("select * from tb_recruit order by rno desc limit #{skip}, #{size}")
	public List<Recruit> getList(Criteria cri);
	

	
	@Select("select * from tb_recruit as r left outer join tb_hash_keyword as h on h.rno=r.rno where h.keyword=#{keyword} order by r.rno desc limit #{skip}, #{size}")
	public List<Recruit> searchList(SearchCriteria scri);
	
	/* 관심채용 등록 및 삭제 */
	@Insert("insert  into tb_fav_recruit (rno, mno) values(#{rno},1)")
	public void registerHeart(Recruit recruit);
	@Delete("delete from tb_fav_recruit where rno=#{rno} and mno=1 ")
	public void deleteHeart(Recruit recruit);
	
	
	@Select("select count(rno) from tb_recruit")
	public int getTotal(Criteria cri);
	
	@Select("select count(r.rno) from tb_recruit as r left outer join tb_hash_keyword as h on h.rno=r.rno where h.keyword in (#{keyword}) ")
	public int getSearchTotal(SearchCriteria scri);
	
	public void addAttach(@Param("rno")Integer rno, @Param("fileName")String fileName);
	
	public void insertTag(@Param("keyword")String keyword);
	
}
