package com.spring.biz.vo;

import java.util.List;

public class ForRecruitVO {
	private String comNum;
	private int announceNum;
	private int comMypageNum;
	private int resumeNum;
	private String resumeResult;
	private String proTitle;
	private String proContent;
	private String comName;
	private List<MemResumeVO>  resumeList;
	
	
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	public String getProContent() {
		return proContent;
	}
	public void setProContent(String proContent) {
		this.proContent = proContent;
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
	public int getComMypageNum() {
		return comMypageNum;
	}
	public void setComMypageNum(int comMypageNum) {
		this.comMypageNum = comMypageNum;
	}
	public int getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}
	public String getResumeResult() {
		return resumeResult;
	}
	public void setResumeResult(String resumeResult) {
		this.resumeResult = resumeResult;
	}
	public List<MemResumeVO> getResumeList() {
		return resumeList;
	}
	public void setResumeList(List<MemResumeVO> resumeList) {
		this.resumeList = resumeList;
	}
	@Override
	public String toString() {
		return "ForRecruitVO [comNum=" + comNum + ", announceNum=" + announceNum + ", comMypageNum=" + comMypageNum
				+ ", resumeNum=" + resumeNum + ", resumeResult=" + resumeResult + ", proTitle=" + proTitle
				+ ", proContent=" + proContent + ", resumeList=" + resumeList + "]";
	}
	
	
}
