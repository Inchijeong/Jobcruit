package com.jobcruit.dto;

import lombok.Data;

@Data
public class SearchCriteria extends Criteria{

	private String searchType;
	private String searchKeyword;
	
	
	@Override
	public String toString() {
		return super.toString() + "SearchCriteria" + "[searchType=" + searchType + 
				", searchKeyword=" + searchKeyword + "]";
	}
	@Override
	public int getSkip() {
		return super.getSkip();
	}
	@Override
	public int getSize() {
		return super.getSize();
	}
	
}
