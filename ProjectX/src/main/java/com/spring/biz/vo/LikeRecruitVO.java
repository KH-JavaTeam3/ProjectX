package com.spring.biz.vo;

public class LikeRecruitVO {
	private int likeRecruitNum;
	private int announceNum;
	private String memEmail;
	private String announceTitle;
	private String uptoHiredate;
	private String workType;
	private String career;
	private String academicBackground;
	private String area;
	private String comNum;
	
	public int getLikeRecruitNum() {
		return likeRecruitNum;
	}
	public void setLikeRecruitNum(int likeRecruitNum) {
		this.likeRecruitNum = likeRecruitNum;
	}
	public int getAnnounceNum() {
		return announceNum;
	}
	public void setAnnounceNum(int announceNum) {
		this.announceNum = announceNum;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getAnnounceTitle() {
		return announceTitle;
	}
	public void setAnnounceTitle(String announceTitle) {
		this.announceTitle = announceTitle;
	}
	public String getUptoHiredate() {
		return uptoHiredate;
	}
	public void setUptoHiredate(String uptoHiredate) {
		this.uptoHiredate = uptoHiredate;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getAcademicBackground() {
		return academicBackground;
	}
	public void setAcademicBackground(String academicBackground) {
		this.academicBackground = academicBackground;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getComNum() {
		return comNum;
	}
	public void setComNum(String comNum) {
		this.comNum = comNum;
	}
	
	@Override
	public String toString() {
		return "LikeRecruitVO [likeRecruitNum=" + likeRecruitNum + ", announceNum=" + announceNum + ", memEmail="
				+ memEmail + ", announceTitle=" + announceTitle + ", uptoHiredate=" + uptoHiredate + ", workType="
				+ workType + ", career=" + career + ", academicBackground=" + academicBackground + ", area=" + area
				+ ", comNum=" + comNum + "]";
	}
}
