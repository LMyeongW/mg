package com.study.demo.vo;

public class AttachImageVO {
	private String uploadPath; //경로
	private String uuid; //uuid
	private String fileName; //파일 이름
	private int emploNo; //사원번호
	
	
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getEmploNo() {
		return emploNo;
	}
	public void setEmploNo(int emploNo) {
		this.emploNo = emploNo;
	}
	@Override
	public String toString() {
		return "AttachImageVO [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", emploNo="
				+ emploNo + "]";
	}
	
	
}
