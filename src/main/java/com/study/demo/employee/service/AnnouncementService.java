package com.study.demo.employee.service;

import java.util.List;

import com.study.demo.vo.AnnouncementVO;

public interface AnnouncementService {
	
	//공지 작성
	void announcementWrite(AnnouncementVO announcementvo);
	
	//공지 메인 리스트 갯수
	int announcementTotalcount();
	
	//공지 메인 리스트
	List<AnnouncementVO> announcementList(int sqlPostNum, int postNum);
	
	//공지 상세페이지
	Object announcementDetail(int announcementNo);
	
	//공지 수정페이지
	Object announcementUpdateGET(int announcementNo);
	
	//공지 수정
	void announcementUpdatePOST(AnnouncementVO announcementvo);
	
	//공지 삭제
	void announcementDelete(int announcementNo);
	
	//공지 전체리스트
	List<AnnouncementVO> announcementAll(int sqlPostNum, int postNum);
	
	//공지 갯수
	int announcementNotifyTotalcount();
	
	//공지 리스트
	List<AnnouncementVO> announcementNotify(int sqlPostNum, int postNum);
	
	//공지 이벤트 갯수
	int announcementEventTotalcount();
	
	//공지 이벤트 리스트
	List<AnnouncementVO> announcementEvent(int sqlPostNum, int postNum);
	
	//공지 상체페이지 리스트 갯수
	int detailListTotalcount(String categoryType);
	
	//공지 상세페이지 리스트
	List<AnnouncementVO> announcementDetailList(int sqlPostNum, int postNum, String categoryType, String detailNum);

}
