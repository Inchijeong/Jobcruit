package com.jobcruit.service;

import java.util.List;
import com.jobcruit.dto.Criteria;
import com.jobcruit.domain.Company;

public interface CompanyService {
	public void register(Company vo) throws Exception;
	public Company get(Long tno);
	public void modify(Company vo);
	public void remove(Long tno);
	public List<Company> getList(Criteria cri);
	public int getListCount(Criteria cri);
}