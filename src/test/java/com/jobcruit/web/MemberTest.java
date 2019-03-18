package com.jobcruit.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jobcruit.domain.Member;
import com.jobcruit.service.MemberService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
   locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MemberTest {
	
	@Autowired
	MemberService service;
	
	@Test
	public void recoverTest() {
		Member vo = new Member();
		vo.setEmail("abc@naver.com");
		vo.setMname("chi");
		vo.setPhoneNo("01022223333");
		log.info("" + service.recover(vo));
	}
	
	@Test
	public void registrTest() {
		Member vo = new Member();
		vo.setCategory(1);
		vo.setEmail("abc@gmail.com");
		vo.setMname("chi");
		vo.setPassword("abc123");
		vo.setPhoneNo("01012345678");
		service.register(vo);
	}
	
	@Test
	public void getTest() {
		log.info("" + service.get(1));
	}
	
	@Test
	public void modifyTest() {
		Member vo = new Member();
		vo.setMno(1);
		vo.setMname("jeong");
		vo.setPhoneNo("01012345678");
		vo.setPassword("1234");
		service.modify(vo);
	}
	
	@Test
	public void removeTest() {
		service.remove(1);
	}
}
