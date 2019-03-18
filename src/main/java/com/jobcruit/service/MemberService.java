package com.jobcruit.service;

import com.jobcruit.domain.Member;

public interface MemberService {
	public void register(Member member);
	public Member get(Integer mno);
	public void modify(Member member);
	public void remove(Integer mno);
	public Integer recover(Member member);
	public Integer checkEmail(String email);
	public Integer getLogin(Member mno);
	public void modifyPassword(Member member);
	public Integer checkPassword(Member member);
}
