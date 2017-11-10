package com.jobcruit.dto;

import java.util.List;

import lombok.Data;

@Data
public class SearchResult<T> {
	private List<T> list;
	private Criteria cri;
	private int total;
}