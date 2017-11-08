package com.jobcruit.mappers;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jobcruit.domain.Member;

public interface MemberMapper extends CRUDMapper<Member, Integer> {

	@Select("select count(email) from tb_member where email = #{email} and mname = #{mname} and phone_no = #{phoneNo}")
	public Integer readPassword(Member vo);
	
	@Select("select count(email) from tb_member where email = #{email}")
	public Integer checkEmail(String email);
	
}
