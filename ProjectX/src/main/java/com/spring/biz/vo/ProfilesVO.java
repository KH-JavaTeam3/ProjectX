package com.spring.biz.vo;

public class ProfilesVO {
	private int proNum;
	private String proTitle;
	private String proContent;
	private int resumeNum;
	
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	public String getProContent() {
		return proContent;
	}
	public void setProContent(String proContent) {
		this.proContent = proContent;
	}
	public int getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}
	@Override
	public String toString() {
		return "ProfilesVO [proNum=" + proNum + ", proTitle=" + proTitle + ", proContent=" + proContent + ", resumeNum="
				+ resumeNum + "]";
	}
	
	
}
