package com.spring.biz.vo;

public class LikeRecruitVO {
	private int likeRecruitNum;
	private int announceNum;
	private String mem_email;
	
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
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	
	@Override
	public String toString() {
		return "LikeRecruitVO [likeRecruitNum=" + likeRecruitNum + ", announceNum=" + announceNum + ", mem_email="
				+ mem_email + "]";
	}
}
