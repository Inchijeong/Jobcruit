package com.jobcruit.mappers;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jobcruit.domain.Member;

public interface MemberMapper extends CRUDMapper<Member, Integer> {

	@Select("select mno from tb_member where email = #{email} and mname = #{mname} and phone_no = #{phoneNo}")
	public Integer readMno(Member member);
	
	@Select("select count(email) from tb_member where email = #{email}")
	public Integer checkEmail(String email);
	
	@Select("select mno from tb_member where email = #{email} and password = #{password}")
	public Integer readLogin(Member member);
	
	@Update("update tb_member set password = #{password} where mno = #{mno}")
	public void updatePassword(Member member);
	
	@Select("select count(mno) from tb_member where mno = #{mno} and password = #{password}")
	public Integer readPassword(Member member);
}
