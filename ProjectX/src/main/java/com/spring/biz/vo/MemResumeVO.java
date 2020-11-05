package com.spring.biz.vo;

import java.util.List;

/**
 * @author user
 *
 */
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
	private double eduScore;
	private String eduIsOver;
	private String hopeType;
	private int hopeSal;
	private String hopeLoc;
	private String hopeTime;
	private String memEmail;
	private List<LicenseVO> licenseList; // 자격증 목록
	private List<ProfilesVO> profilesList; // 자소서 목록
	private List<CareerVO> careerList; // 경력사항 목록
	private int comMypageNum;
	private String comNum;
	private String comName;
	private String memName;
	private int announceNum;
	private String resumeResult;
	private MemInfoVO memInfoVO;
	private int ynN;
	private int carCareer;
	private String carType;
	private String carCompany;
	private String carPosition;
	
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getCarCompany() {
		return carCompany;
	}
	public void setCarCompany(String carCompany) {
		this.carCompany = carCompany;
	}
	public String getCarPosition() {
		return carPosition;
	}
	public void setCarPosition(String carPosition) {
		this.carPosition = carPosition;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public int getCarCareer() {
		return carCareer;
	}
	public void setCarCareer(int carCareer) {
		this.carCareer = carCareer;
	}
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
	public double getEduScore() {
		return eduScore;
	}
	public void setEduScore(double eduScore) {
		this.eduScore = eduScore;
	}
	public String getEduIsOver() {
		return eduIsOver;
	}
	public void setEduIsOver(String eduIsOver) {
		this.eduIsOver = eduIsOver;
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
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
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
	public List<CareerVO> getCareerList() {
		return careerList;
	}
	public void setCareerList(List<CareerVO> careerList) {
		this.careerList = careerList;
	}
	public int getComMypageNum() {
		return comMypageNum;
	}
	public void setComMypageNum(int comMypageNum) {
		this.comMypageNum = comMypageNum;
	}
	public String getComNum() {
		return comNum;
	}
	public void setComNum(String comNum) {
		this.comNum = comNum;
	}
	public int getAnnounceNum() {
		return announceNum;
	}
	public void setAnnounceNum(int announceNum) {
		this.announceNum = announceNum;
	}
	public String getResumeResult() {
		return resumeResult;
	}
	public void setResumeResult(String resumeResult) {
		this.resumeResult = resumeResult;
	}
	public MemInfoVO getMemInfoVO() {
		return memInfoVO;
	}
	public void setMemInfoVO(MemInfoVO memInfoVO) {
		this.memInfoVO = memInfoVO;
	}
	public int getYnN() {
		return ynN;
	}
	public void setYnN(int ynN) {
		this.ynN = ynN;
	}
	@Override
	public String toString() {
		return "MemResumeVO [resumeNum=" + resumeNum + ", resumeName=" + resumeName + ", resumeDate=" + resumeDate
				+ ", eduGrade=" + eduGrade + ", eduSchool=" + eduSchool + ", eduLoc=" + eduLoc + ", eduType=" + eduType
				+ ", eduMajor=" + eduMajor + ", eduBeginDate=" + eduBeginDate + ", eduEndDate=" + eduEndDate
				+ ", eduScore=" + eduScore + ", eduIsOver=" + eduIsOver + ", hopeType=" + hopeType + ", hopeSal="
				+ hopeSal + ", hopeLoc=" + hopeLoc + ", hopeTime=" + hopeTime + ", memEmail=" + memEmail
				+ ", licenseList=" + licenseList + ", profilesList=" + profilesList + ", careerList=" + careerList
				+ ", comMypageNum=" + comMypageNum + ", comNum=" + comNum + ", comName=" + comName + ", memName="
				+ memName + ", announceNum=" + announceNum + ", resumeResult=" + resumeResult + ", memInfoVO="
				+ memInfoVO + ", ynN=" + ynN + ", carCareer=" + carCareer + ", carType=" + carType + ", carCompany="
				+ carCompany + ", carPosition=" + carPosition + "]";
	}
	
	
	
}
