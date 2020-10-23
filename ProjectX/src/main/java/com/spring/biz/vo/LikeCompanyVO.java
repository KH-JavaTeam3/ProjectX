package com.spring.biz.vo;

public class LikeCompanyVO {
	private int likeNum;
	private String comNum;
	private String memEmail;
	private String comName;
	private int announceNum;
	
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
	public int getAnnounceNum() {
		return announceNum;
	}
	public void setAnnounceNum(int announceNum) {
		this.announceNum = announceNum;
	}
	
	@Override
	public String toString() {
		return "LikeCompanyVO [likeNum=" + likeNum + ", comNum=" + comNum + ", memEmail=" + memEmail + ", comName="
				+ comName + ", announceNum=" + announceNum + "]";
	}
	
}
