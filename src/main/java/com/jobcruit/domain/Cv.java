package com.jobcruit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Cv {
	Integer cvAno;
	Integer mno;
	String filePath;
	String fileName;
	String title;
	Date regDate; 
}
