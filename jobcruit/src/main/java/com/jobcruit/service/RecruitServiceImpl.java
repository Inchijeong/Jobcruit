package com.jobcruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jobcruit.domain.HashTag;
import com.jobcruit.domain.Recruit;
import com.jobcruit.dto.Criteria;
import com.jobcruit.dto.SearchCriteria;
import com.jobcruit.mappers.RecruitMapper;

import lombok.extern.java.Log;

@Log
@Service
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitMapper mapper;
	
	@Override
	@Transactional
	public String register(Recruit recruit, String keyword) {
		try {
			String[] arr;
			log.info("" + recruit);
			mapper.create(recruit);
			arr = keyword.split(",");
			for(int i = 0; i<arr.length; i++) {
				mapper.insertTag(arr[i]);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "등록에 성공하였습니다.";
	}

	@Override
	public Recruit get(Integer rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public void modify(Recruit recruit) {
		mapper.update(recruit);
		
	}

	@Override
	public void remove(Integer rno) {
		mapper.delete(rno);
		
	}

	@Override
	public List<Recruit> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(cri);
	}

	@Override
	public int getListCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}
	@Override
	public int getSearchCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return mapper.getSearchTotal(scri);
	}

	@Override
	@Transactional
	public void register(Recruit recruit, String[] files) {

		mapper.create(recruit);
		log.info("recruit" + recruit.toString());
		
		for(int i = 0; i < files.length; i++) {
			mapper.addAttach(recruit.getRno(), files[i]);
		}
	}

	@Override
	public String getKeyword(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return scri.getKeyword();
	}

	@Override
	public List<Recruit> searchList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		log.info("------------------aojdngoan111"+scri.getKeyword());
		
		return mapper.searchList(scri);
	}

	@Override
	public void registerHeart(Recruit recruit) {
		mapper.registerHeart(recruit);
		
	}

	@Override
	public void deleteHeart(Recruit recruit) {
		mapper.deleteHeart(recruit);
		
	}

}
