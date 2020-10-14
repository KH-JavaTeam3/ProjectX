package com.spring.biz.vo;

public class MemInfoVO {
	private String memEmail;    
	private String memPass;    
	private String memName;  
	private String memAge;     
	private String memGender;  
	private String memBirth;
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
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	@Override
	public String toString() {
		return "MemInfoVO [memEmail=" + memEmail + ", memPass=" + memPass + ", memName=" + memName + ", memAge="
				+ memAge + ", memGender=" + memGender + ", memBirth=" + memBirth + ", memTel1=" + memTel1 + ", memTel2="
				+ memTel2 + ", memAddr=" + memAddr + ", delYn=" + delYn + ", memJoinDate=" + memJoinDate + ", isAdmin="
				+ isAdmin + ", memImage=" + memImage + "]";
	}
	
}
