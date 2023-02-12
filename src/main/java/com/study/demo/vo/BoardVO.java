package com.study.demo.vo;

import java.util.Date;

public class BoardVO {
	private int boardNo;
	private String employeeId;
	private String boardTitle;
	private String boardCategory;
	private String boardRegdate;
	private String boardContent;
	private String boardHits;
	
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
		if(boardCategory.equals("a1")) {
			this.boardCategory = "인사말";
		} else if(boardCategory.equals("a2")) {
			this.boardCategory = "정보공유";
		} else if(boardCategory.equals("a3")) {
			this.boardCategory = "건강";
		} else if(boardCategory.equals("a4")) {
			this.boardCategory = "기타";
		}
	}
	public String getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(String boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(String boardHits) {
		this.boardHits = boardHits;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", employeeId=" + employeeId + ", boardTitle=" + boardTitle
				+ ", boardCategory=" + boardCategory + ", boardRegdate=" + boardRegdate + ", boardContent="
				+ boardContent + ", boardHits=" + boardHits + "]";
	}
	
	
}
