package com.spring.biz.vo;

public class LicenseVO {
	private int licNum;
	private String licName;
	private String licLoc;
	private String licGrade;
	private String licDate;
	private int resumeNum;
	
	public int getLicNum() {
		return licNum;
	}
	public void setLicNum(int licNum) {
		this.licNum = licNum;
	}
	public String getLicName() {
		return licName;
	}
	public void setLicName(String licName) {
		this.licName = licName;
	}
	public String getLicLoc() {
		return licLoc;
	}
	public void setLicLoc(String licLoc) {
		this.licLoc = licLoc;
	}
	public String getLicGrade() {
		return licGrade;
	}
	public void setLicGrade(String licGrade) {
		this.licGrade = licGrade;
	}
	public String getLicDate() {
		return licDate;
	}
	public void setLicDate(String licDate) {
		this.licDate = licDate;
	}
	public int getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}
	
	@Override
	public String toString() {
		return "LicenseVO [licNum=" + licNum + ", licName=" + licName + ", licLoc=" + licLoc + ", licGrade=" + licGrade
				+ ", licDate=" + licDate + ", resumeNum=" + resumeNum + "]";
	}
	
	

}