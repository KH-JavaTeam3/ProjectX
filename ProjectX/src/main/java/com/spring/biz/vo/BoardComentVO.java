package com.spring.biz.vo;

public class BoardComentVO {
	private int boardComentNum;
	private int boardNum;
	private String boardComentWriter;
	private String boardComentDate;
	private String boardComentContent;
	private String boardComentEmail;
	
	
	
	public String getBoardComentEmail() {
		return boardComentEmail;
	}
	public void setBoardComentEmail(String boardComentEmail) {
		this.boardComentEmail = boardComentEmail;
	}
	public int getBoardComentNum() {
		return boardComentNum;
	}
	public void setBoardComentNum(int boardComentNum) {
		this.boardComentNum = boardComentNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardComentWriter() {
		return boardComentWriter;
	}
	public void setBoardComentWriter(String boardComentWriter) {
		this.boardComentWriter = boardComentWriter;
	}
	public String getBoardComentDate() {
		return boardComentDate;
	}
	public void setBoardComentDate(String boardComentDate) {
		this.boardComentDate = boardComentDate;
	}
	public String getBoardComentContent() {
		return boardComentContent;
	}
	public void setBoardComentContent(String boardComentContent) {
		this.boardComentContent = boardComentContent;
	}
	@Override
	public String toString() {
		return "BoardComentVO [boardComentNum=" + boardComentNum + ", boardNum=" + boardNum + ", boardComentWriter="
				+ boardComentWriter + ", boardComentDate=" + boardComentDate + ", boardComentContent="
				+ boardComentContent + ", boardComentEmail=" + boardComentEmail + "]";
	}
	
	
	
	
}
