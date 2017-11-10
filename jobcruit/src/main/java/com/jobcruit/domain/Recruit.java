package com.jobcruit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Recruit {
	private Integer rno;
	private String cid;
	private String title;
	private String career;
	private String eduLevel;
	private String prefer;
	private String hireType;
	private String position;
	private String eligibility;
	private String dowhat;
	private Date regDate;

}
