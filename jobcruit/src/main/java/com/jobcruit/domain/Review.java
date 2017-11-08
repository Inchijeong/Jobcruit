package com.jobcruit.domain;

import lombok.Data;

@Data
public class Review {
	private Integer rvno, cid; 
	private Double grade;
	private String title, merit, weakness;
}
