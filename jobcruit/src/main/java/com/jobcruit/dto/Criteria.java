package com.jobcruit.dto;

public class Criteria {
	
	private int page;
	private int size;

	
	public Criteria() {
		this(1,10);
	}
	public Criteria(int page, int size) {
		this.page = page;
		this.size = size;
	}

	public int getSkip() {
		return (this.page-1)*this.size;
	}
	
	public int getSize() {
		return this.size != 0? this.size : 10;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	public int getPage() {
		return this.page;
	}

}
