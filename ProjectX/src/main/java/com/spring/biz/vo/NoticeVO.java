package com.spring.biz.vo;

public class NoticeVO {
	private String noticeNum;
	private String noticeTitle;
	private String noticeContent;
	private String noticeViews;
	public String getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(String noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(String noticeViews) {
		this.noticeViews = noticeViews;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeViews=" + noticeViews + "]";
	}
	
}
