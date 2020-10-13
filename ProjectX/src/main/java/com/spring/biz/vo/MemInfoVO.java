package com.spring.biz.vo;

public class MemInfoVO {
	private String memEmail;    
	private String memPass;    
	private String memName;  
	private String memAge;     
	private String memGender;  
	private int memBirthYear;
	private int memBirthMonth;
	private int memBirthDay;
	private String memTel1;  
	private String memTel2;    
	private String memAddr;    
	private String delYn;      
	private String memJoinDate;
	private String isAdmin;  
	private String memImage;
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemAge() {
		return memAge;
	}
	public void setMemAge(String memAge) {
		this.memAge = memAge;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public int getMemBirthYear() {
		return memBirthYear;
	}
	public void setMemBirthYear(int memBirthYear) {
		this.memBirthYear = memBirthYear;
	}
	public int getMemBirthMonth() {
		return memBirthMonth;
	}
	public void setMemBirthMonth(int memBirthMonth) {
		this.memBirthMonth = memBirthMonth;
	}
	public int getMemBirthDay() {
		return memBirthDay;
	}
	public void setMemBirthDay(int memBirthDay) {
		this.memBirthDay = memBirthDay;
	}
	public String getMemTel1() {
		return memTel1;
	}
	public void setMemTel1(String memTel1) {
		this.memTel1 = memTel1;
	}
	public String getMemTel2() {
		return memTel2;
	}
	public void setMemTel2(String memTel2) {
		this.memTel2 = memTel2;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getMemJoinDate() {
		return memJoinDate;
	}
	public void setMemJoinDate(String memJoinDate) {
		this.memJoinDate = memJoinDate;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getMemImage() {
		return memImage;
	}
	public void setMemImage(String memImage) {
		this.memImage = memImage;
	}
	@Override
	public String toString() {
		return "MemInfoVO [memEmail=" + memEmail + ", memPass=" + memPass + ", memName=" + memName + ", memAge="
				+ memAge + ", memGender=" + memGender + ", memBirthYear=" + memBirthYear + ", memBirthMonth="
				+ memBirthMonth + ", memBirthDay=" + memBirthDay + ", memTel1=" + memTel1 + ", memTel2=" + memTel2
				+ ", memAddr=" + memAddr + ", delYn=" + delYn + ", memJoinDate=" + memJoinDate + ", isAdmin=" + isAdmin
				+ ", memImage=" + memImage + "]";
	}   
}
