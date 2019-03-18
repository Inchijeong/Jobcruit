package com.jobcruit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeBoard {
	private Integer fno;
	private int mno;
	private int readCount;
	private int commCount;
	private int isAttach;
	private String title;
	private String content;
	private String mname;
	private Date regDate;
	private Date modiDate;
}