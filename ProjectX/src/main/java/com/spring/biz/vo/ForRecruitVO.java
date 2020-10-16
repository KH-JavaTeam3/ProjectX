package com.spring.biz.vo;

import java.util.List;

public class ForRecruitVO {
	private int comNum;
	private List<MemResumeVO>  resumeList;
	
	public int getComNum() {
		return comNum;
	}
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	public List<MemResumeVO> getResumeList() {
		return resumeList;
	}
	public void setResumeList(List<MemResumeVO> resumeList) {
		this.resumeList = resumeList;
	}
	
	
}
