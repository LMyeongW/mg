package com.study.demo.vo;

public class AnnouncementVO {
	private int announcementNo;
	private String announcementTitle;
	private String announcementCategory;
	private String announcementRegdate;
	private String announcementContent;
	public int getAnnouncementNo() {
		return announcementNo;
	}
	public void setAnnouncementNo(int announcementNo) {
		this.announcementNo = announcementNo;
	}
	public String getAnnouncementTitle() {
		return announcementTitle;
	}
	public void setAnnouncementTitle(String announcementTitle) {
		this.announcementTitle = announcementTitle;
	}
	public String getAnnouncementCategory() {
		return announcementCategory;
	}
	public void setAnnouncementCategory(String announcementCategory) {
		this.announcementCategory = announcementCategory;
		if(announcementCategory.equals("a1")) {
			this.announcementCategory = "공지사항";
		} else if(announcementCategory.equals("a2")) {
			this.announcementCategory = "이벤트";
		}
	}
	public String getAnnouncementRegdate() {
		return announcementRegdate;
	}
	public void setAnnouncementRegdate(String announcementRegdate) {
		this.announcementRegdate = announcementRegdate;
	}
	public String getAnnouncementContent() {
		return announcementContent;
	}
	public void setAnnouncementContent(String announcementContent) {
		this.announcementContent = announcementContent;
	}
	
	@Override
	public String toString() {
		return "AnnouncementVO [announcementNo=" + announcementNo + ", announcementTitle=" + announcementTitle
				+ ", announcementCategory=" + announcementCategory + ", announcementRegdate=" + announcementRegdate
				+ ", announcementContent=" + announcementContent + "]";
	}
	
	

}
