package com.spring.biz.vo;

public class BoardVO {
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private int	boardViews;
	private String boardDate;
	private int boardNum;
	private String boardWriterName;
	private String select;
	private String search;
	private String boardCategory;
	private int boardCount;
	private String boardRealWriterName;
	private String delYn;
	private String comentCnt;
	
	
	
	public String getComentCnt() {
		return comentCnt;
	}
	public void setComentCnt(String comentCnt) {
		this.comentCnt = comentCnt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getBoardRealWriterName() {
		return boardRealWriterName;
	}
	public void setBoardRealWriterName(String boardRealWriterName) {
		this.boardRealWriterName = boardRealWriterName;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getBoardWriterName() {
		return boardWriterName;
	}
	public void setBoardWriterName(String boardWriterName) {
		this.boardWriterName = boardWriterName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardViews() {
		return boardViews;
	}
	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardTitle=" + boardTitle + ", boardWriter=" + boardWriter + ", boardContent=" + boardContent
				+ ", boardViews=" + boardViews + ", boardDate=" + boardDate + ", boardNum=" + boardNum
				+ ", boardWriterName=" + boardWriterName + ", select=" + select + ", search=" + search
				+ ", boardCategory=" + boardCategory + ", boardCount=" + boardCount + ", boardRealWriterName="
				+ boardRealWriterName + ", delYn=" + delYn + ", comentCnt=" + comentCnt + "]";
	}
	
	
	
	
	
}
