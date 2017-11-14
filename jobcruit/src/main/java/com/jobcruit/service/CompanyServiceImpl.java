package com.jobcruit.service;

import java.util.List;
import com.jobcruit.domain.Company;
import com.jobcruit.dto.Criteria;
import com.jobcruit.mappers.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.java.Log;

@Log
@Service
public class CompanyServiceImpl implements CompanyService {


	@Autowired
	private CompanyMapper mapper;


	@Override
	public void register(Company vo) throws Exception {
		log.info("service - register");
		log.info(vo.toString());
		
		mapper.create(vo);
	}

	@Override
	public Company get(Long cid) {
		log.info("get");
		return mapper.read(cid);
	}

	@Override
	public void modify(Company vo) {
		log.info("service - modify");
		mapper.update(vo);
	}

	@Override
	public void remove(Long cid) {
		log.info("remove");
		mapper.delete(cid);
	}

	@Override
	public int getListCount(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public List<Company> getList(Criteria cri, Integer mno) {
		log.info("getList"+ cri );
		Integer size = cri.getSize();
		Integer skip = cri.getSkip();
		return mapper.getlist(mno, size, skip);
	}

	@Override
	public List<Company> getListAll(Criteria cri) {
		log.info("getListAll");
		return mapper.getlistAll(cri);
	}

}
