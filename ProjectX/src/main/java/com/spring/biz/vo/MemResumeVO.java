package com.spring.biz.vo;

import java.util.List;

public class MemResumeVO {
	private int resumeNum;
	private String resumeName;
	private String resumeDate;
	private String eduGrade;
	private String eduSchool;
	private String eduLoc;
	private String eduType;
	private String eduMajor;
	private String eduBeginDate;
	private String eduEndDate;
	private int eduScore;
	private String eduIsOver;
	private String beCompany;
	private int beCareer;
	private String beType;
	private String bePosition;
	private String hopeType;
	private int hopeSal;
	private String hopeLoc;
	private String hopeTime;
	private List<LicenseVO> licenseList;
	private List<ProfilesVO> profilesList;
	
	public int getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}
	public String getResumeName() {
		return resumeName;
	}
	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}
	
	public String getResumeDate() {
		return resumeDate;
	}
	public void setResumeDate(String resumeDate) {
		this.resumeDate = resumeDate;
	}
	public String getEduGrade() {
		return eduGrade;
	}
	public void setEduGrade(String eduGrade) {
		this.eduGrade = eduGrade;
	}
	public String getEduSchool() {
		return eduSchool;
	}
	public void setEduSchool(String eduSchool) {
		this.eduSchool = eduSchool;
	}
	public String getEduLoc() {
		return eduLoc;
	}
	public void setEduLoc(String eduLoc) {
		this.eduLoc = eduLoc;
	}
	public String getEduType() {
		return eduType;
	}
	public void setEduType(String eduType) {
		this.eduType = eduType;
	}
	public String getEduMajor() {
		return eduMajor;
	}
	public void setEduMajor(String eduMajor) {
		this.eduMajor = eduMajor;
	}
	public String getEduBeginDate() {
		return eduBeginDate;
	}
	public void setEduBeginDate(String eduBeginDate) {
		this.eduBeginDate = eduBeginDate;
	}
	public String getEduEndDate() {
		return eduEndDate;
	}
	public void setEduEndDate(String eduEndDate) {
		this.eduEndDate = eduEndDate;
	}
	public String getEduIsOver() {
		return eduIsOver;
	}
	public void setEduIsOver(String eduIsOver) {
		this.eduIsOver = eduIsOver;
	}
	public String getBeCompany() {
		return beCompany;
	}
	public void setBeCompany(String beCompany) {
		this.beCompany = beCompany;
	}
	public int getBeCareer() {
		return beCareer;
	}
	public void setBeCareer(int beCareer) {
		this.beCareer = beCareer;
	}
	public String getBeType() {
		return beType;
	}
	public void setBeType(String beType) {
		this.beType = beType;
	}
	public String getBePosition() {
		return bePosition;
	}
	public void setBePosition(String bePosition) {
		this.bePosition = bePosition;
	}
	public String getHopeType() {
		return hopeType;
	}
	public void setHopeType(String hopeType) {
		this.hopeType = hopeType;
	}
	public int getHopeSal() {
		return hopeSal;
	}
	public void setHopeSal(int hopeSal) {
		this.hopeSal = hopeSal;
	}
	public String getHopeLoc() {
		return hopeLoc;
	}
	public void setHopeLoc(String hopeLoc) {
		this.hopeLoc = hopeLoc;
	}
	public String getHopeTime() {
		return hopeTime;
	}
	public void setHopeTime(String hopeTime) {
		this.hopeTime = hopeTime;
	}
	public int getEduScore() {
		return eduScore;
	}
	public void setEduScore(int eduScore) {
		this.eduScore = eduScore;
	}
	
	public List<LicenseVO> getLicenseList() {
		return licenseList;
	}
	public void setLicenseList(List<LicenseVO> licenseList) {
		this.licenseList = licenseList;
	}
	public List<ProfilesVO> getProfilesList() {
		return profilesList;
	}
	public void setProfilesList(List<ProfilesVO> profilesList) {
		this.profilesList = profilesList;
	}
	@Override
	public String toString() {
		return "MemResumeVO [resumeNum=" + resumeNum + ", resumeName=" + resumeName + ", resumeDate=" + resumeDate
				+ ", eduGrade=" + eduGrade + ", eduSchool=" + eduSchool + ", eduLoc=" + eduLoc + ", eduType=" + eduType
				+ ", eduMajor=" + eduMajor + ", eduBeginDate=" + eduBeginDate + ", eduEndDate=" + eduEndDate
				+ ", eduScore=" + eduScore + ", eduIsOver=" + eduIsOver + ", beCompany=" + beCompany + ", beCareer="
				+ beCareer + ", beType=" + beType + ", bePosition=" + bePosition + ", hopeType=" + hopeType
				+ ", hopeSal=" + hopeSal + ", hopeLoc=" + hopeLoc + ", hopeTime=" + hopeTime + ", licenseList="
				+ licenseList + ", profilesList=" + profilesList + "]";
	}
	
	
	
	
}
