package com.jobcruit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobcruit.domain.Cv;
import com.jobcruit.domain.Member;
import com.jobcruit.mappers.MemberMapper;

@Service
public class MemberServieImpl implements MemberService {

	@Autowired
	MemberMapper mapper;

	@Override
	public Integer checkPassword(Member member) {
		return mapper.readPassword(member);
	}

	@Override
	public void modifyPassword(Member member) {
		mapper.updatePassword(member);
	}

	@Override
	public Integer getLogin(Member member) {
		return mapper.readLogin(member);
	}

	@Override
	public Integer checkEmail(String email) {
		return mapper.checkEmail(email);
	}

	@Override
	public Integer recover(Member member) {
		return mapper.readMno(member);
	}

	@Override
	public void register(Member member) {
		mapper.create(member);
	}

	@Override
	public Member get(Integer mno) {
		return mapper.read(mno);
	}

	@Override
	public void modify(Member member) {
		mapper.update(member);
	}

	@Override
	public void remove(Integer mno) {
		mapper.delete(mno);
	}

}
