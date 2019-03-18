package com.jobcruit.domain;

import lombok.Data;

@Data
public class Member {
	private Integer mno;
	private String email;
	private String mname;
	private String phoneNo;
	private String password;
	private Integer category;
}
