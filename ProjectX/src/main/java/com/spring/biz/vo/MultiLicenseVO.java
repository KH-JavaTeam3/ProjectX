package com.spring.biz.vo;

import java.util.Arrays;

public class MultiLicenseVO {
	private String[] licName;
	private String[] licLoc;
	private String[] licGrade;
	private String[] licDate;
	public String[] getLicName() {
		return licName;
	}
	public void setLicName(String[] licName) {
		this.licName = licName;
	}
	public String[] getLicLoc() {
		return licLoc;
	}
	public void setLicLoc(String[] licLoc) {
		this.licLoc = licLoc;
	}
	public String[] getLicGrade() {
		return licGrade;
	}
	public void setLicGrade(String[] licGrade) {
		this.licGrade = licGrade;
	}
	public String[] getLicDate() {
		return licDate;
	}
	public void setLicDate(String[] licDate) {
		this.licDate = licDate;
	}
	@Override
	public String toString() {
		return "MultiLicenseVO [licName=" + Arrays.toString(licName) + ", licLoc=" + Arrays.toString(licLoc)
				+ ", licGrade=" + Arrays.toString(licGrade) + ", licDate=" + Arrays.toString(licDate) + "]";
	}
	
	
}
