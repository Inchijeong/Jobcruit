package com.jobcruit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobcruit.domain.Member;
import com.jobcruit.mappers.MemberMapper;

@Service
public class MemberServieImpl implements MemberService {

	@Autowired
	MemberMapper mapper;

	@Override
	public Integer getLogin(Member vo) {
		return mapper.readLogin(vo);
	}

//	@Override
//	public String login(Member vo) {
//		return mapper.readLogin(vo);
//	}

	@Override
	public Integer checkEmail(String email) {
		return mapper.checkEmail(email);
	}

	@Override
	public Integer recover(Member vo) {
		return mapper.readPassword(vo);
	}

	@Override
	public void register(Member vo) {
		mapper.create(vo);
	}

	@Override
	public Member get(Integer key) {
		return mapper.read(key);
	}

	@Override
	public void modify(Member vo) {
		mapper.update(vo);
	}

	@Override
	public void remove(Integer key) {
		mapper.delete(key);
	}

}
