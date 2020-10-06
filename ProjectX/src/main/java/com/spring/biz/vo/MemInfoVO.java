package com.spring.biz.vo;

public class MemInfoVO {
	private String memEmail;
	private String memPass;
	private String memName;
	private int memAge;
	private String memGender;
	private int memBirth;
	private int memTel1;
	private int memTel2;
	private String memAddr;
	private String memMerry;
	private String delYn;
	private String memJoinDate;
	
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
	public int getMemAge() {
		return memAge;
	}
	public void setMemAge(int memAge) {
		this.memAge = memAge;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public int getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(int memBirth) {
		this.memBirth = memBirth;
	}
	public int getMemTel1() {
		return memTel1;
	}
	public void setMemTel1(int memTel1) {
		this.memTel1 = memTel1;
	}
	public int getMemTel2() {
		return memTel2;
	}
	public void setMemTel2(int memTel2) {
		this.memTel2 = memTel2;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemMerry() {
		return memMerry;
	}
	public void setMemMerry(String memMerry) {
		this.memMerry = memMerry;
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
	@Override
	public String toString() {
		return "EmpInfoVO [memEmail=" + memEmail + ", memPass=" + memPass + ", memName=" + memName + ", memAge="
				+ memAge + ", memGender=" + memGender + ", memBirth=" + memBirth + ", memTel1=" + memTel1 + ", memTel2="
				+ memTel2 + ", memAddr=" + memAddr + ", memMerry=" + memMerry + ", delYn=" + delYn + ", memJoinDate="
				+ memJoinDate + "]";
	}
	

	
}
