package com.jobcruit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeComment {
	private Integer freeCno;
	private Integer fno;
	private int mno;
	private String mname;
	private String content;
	private Date regDate;
}