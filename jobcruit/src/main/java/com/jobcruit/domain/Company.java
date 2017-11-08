package com.jobcruit.domain;

import java.util.Date;
import lombok.Data;

@Data
public class Company {
	private String cname, company_info, homepage, address, logo;
	private Integer cid, mno;
}
