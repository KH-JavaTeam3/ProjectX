package com.spring.biz.vo;

public class ApplyVO {
	private int applyNum;
	private String comName;
	private String applyDate;
	private String announceTitle;
	private String resumeResult;
	
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getResumeResult() {
		return resumeResult;
	}
	public void setResumeResult(String resumeResult) {
		this.resumeResult = resumeResult;
	}
	public int getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getAnnounceTitle() {
		return announceTitle;
	}
	public void setAnnounceTitle(String announceTitle) {
		this.announceTitle = announceTitle;
	}
	@Override
	public String toString() {
		return "ApplyVO [applyNum=" + applyNum + ", comName=" + comName + ", applyDate=" + applyDate
				+ ", announceTitle=" + announceTitle + ", resumeResult=" + resumeResult + "]";
	}
	
	
}
