package com.spring.biz.vo;

public class AdminNoticeVO {
	private int boardNumber;
	private String boardTitle;
	private String boardContent;
	private String todayDate;
	
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getTodayDate() {
		return todayDate;
	}
	public void setTodayDate(String todayDate) {
		this.todayDate = todayDate;
	}
	@Override
	public String toString() {
		return "AdminNoticeVO [boardNumber=" + boardNumber + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", todayDate=" + todayDate + "]";
	}
	
	
}
