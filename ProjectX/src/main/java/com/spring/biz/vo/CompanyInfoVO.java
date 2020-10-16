package com.spring.biz.vo;

public class CompanyInfoVO {
	private String comNum;
	private String comPass;
	private String comEmail;
	private String comName;
	private String comCeo;
	private String comLoc;
	private String comType;
	private String comTel;
	private String comJoinDate;
	private int comAvgScore;
	private int comGivePerson;
	private int comScore;
	private String comImage;
	
	
	
	public String getComImage() {
		return comImage;
	}
	public void setComImage(String comImage) {
		this.comImage = comImage;
	}
	public String getComNum() {
		return comNum;
	}
	public void setComNum(String comNum) {
		this.comNum = comNum;
	}
	public String getComPass() {
		return comPass;
	}
	public void setComPass(String comPass) {
		this.comPass = comPass;
	}
	public String getComEmail() {
		return comEmail;
	}
	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComCeo() {
		return comCeo;
	}
	public void setComCeo(String comCeo) {
		this.comCeo = comCeo;
	}
	public String getComLoc() {
		return comLoc;
	}
	public void setComLoc(String comLoc) {
		this.comLoc = comLoc;
	}
	public String getComType() {
		return comType;
	}
	public void setComType(String comType) {
		this.comType = comType;
	}
	public String getComTel() {
		return comTel;
	}
	public void setComTel(String comTel) {
		this.comTel = comTel;
	}
	public String getComJoinDate() {
		return comJoinDate;
	}
	public void setComJoinDate(String comJoinDate) {
		this.comJoinDate = comJoinDate;
	}
	public int getComAvgScore() {
		return comAvgScore;
	}
	public void setComAvgScore(int comAvgScore) {
		this.comAvgScore = comAvgScore;
	}
	public int getComGivePerson() {
		return comGivePerson;
	}
	public void setComGivePerson(int comGivePerson) {
		this.comGivePerson = comGivePerson;
	}
	public int getComScore() {
		return comScore;
	}
	public void setComScore(int comScore) {
		this.comScore = comScore;
	}
	@Override
	public String toString() {
		return "CompanyInfoVO [comNum=" + comNum + ", comPass=" + comPass + ", comEmail=" + comEmail + ", comName="
				+ comName + ", comCeo=" + comCeo + ", comLoc=" + comLoc + ", comType=" + comType + ", comTel=" + comTel
				+ ", comJoinDate=" + comJoinDate + ", comAvgScore=" + comAvgScore + ", comGivePerson=" + comGivePerson
				+ ", comScore=" + comScore + ", comImage=" + comImage + "]";
	}
	
	
	
	
	
}
