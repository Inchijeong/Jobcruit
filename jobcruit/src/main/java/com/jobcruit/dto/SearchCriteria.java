package com.jobcruit.dto;

import lombok.Data;

@Data
public class SearchCriteria extends Criteria{

	private String searchType;
	private String keyword;
	
	
	@Override
	public String toString() {
		return super.toString() + "SearchCriteria" + "[searchType=" + searchType + 
				", keyword=" + keyword + "]";
	}
	
}
