package com.jobcruit.service;

import com.jobcruit.domain.Member;

public interface MemberService {
	public void register(Member vo);
	public Member get(Integer key);
	public void modify(Member vo);
	public void remove(Integer key);
	public Integer recover(Member vo);
	public Integer checkEmail(String email);
}
