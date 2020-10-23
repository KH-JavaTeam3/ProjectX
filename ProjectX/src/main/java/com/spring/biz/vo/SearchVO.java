package com.spring.biz.vo;

public class SearchVO {
	private String keyword;
	private String place;
	private String jobtype;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getJobtype() {
		return jobtype;
	}
	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}
	@Override
	public String toString() {
		return "SearchVO [keyword=" + keyword + ", place=" + place + ", jobtype=" + jobtype + "]";
	}
	
	
	
	
}
