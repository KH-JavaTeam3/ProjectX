package com.spring.biz.vo;

import java.util.Arrays;

public class MultiProfilesVO {
	private String[] proTitle; 
	private String[] proContent;
	public String[] getProTitle() {
		return proTitle;
	}
	public void setProTitle(String[] proTitle) {
		this.proTitle = proTitle;
	}
	public String[] getProContent() {
		return proContent;
	}
	public void setProContent(String[] proContent) {
		this.proContent = proContent;
	}
	@Override
	public String toString() {
		return "MultiProfilesVO [proTitle=" + Arrays.toString(proTitle) + ", proContent=" + Arrays.toString(proContent)
				+ "]";
	}
	
	
	
}
