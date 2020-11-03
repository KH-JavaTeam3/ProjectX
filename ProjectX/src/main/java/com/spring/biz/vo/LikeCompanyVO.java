package com.spring.biz.vo;

public class LikeCompanyVO {
	private int likeNum;
	private String comNum;
	private String memEmail;
	private String comName;
	private String comLoc;
	private String comType;
	private String comEmail;
	private String comTel;
	
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
	public String getComEmail() {
		return comEmail;
	}
	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}
	public String getComTel() {
		return comTel;
	}
	public void setComTel(String comTel) {
		this.comTel = comTel;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public String getComNum() {
		return comNum;
	}
	public void setComNum(String comNum) {
		this.comNum = comNum;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
	@Override
	public String toString() {
		return "LikeCompanyVO [likeNum=" + likeNum + ", comNum=" + comNum + ", memEmail=" + memEmail + ", comName="
				+ comName + ", comLoc=" + comLoc + ", comType=" + comType + ", comEmail=" + comEmail + ", comTel="
				+ comTel + "]";
	}
	
}
