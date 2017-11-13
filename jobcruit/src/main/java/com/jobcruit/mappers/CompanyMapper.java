package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import com.jobcruit.domain.Company;
import com.jobcruit.dto.Criteria;


public interface CompanyMapper extends CRUDMapper<Company, Long> {

	@Select("select * from tb_company order by cid desc limit #{skip}, #{size}")
	public List<Company> getlist(Criteria cri);
	
	@Select("select count(cid) from tb_company")
	public int getTotal(Criteria cri);
}