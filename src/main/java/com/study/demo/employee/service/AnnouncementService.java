package com.study.demo.employee.service;

import java.util.List;

import com.study.demo.vo.AnnouncementVO;

public interface AnnouncementService {

	void announcementWrite(AnnouncementVO announcementvo);

	int announcementTotalcount();

	List<AnnouncementVO> announcementList(int sqlPostNum, int postNum);

	Object announcementDetail(int announcementNo);

	Object announcementUpdateGET(int announcementNo);

	void announcementUpdatePOST(AnnouncementVO announcementvo);

	void announcementDelete(int announcementNo);

	List<AnnouncementVO> announcementAll(int sqlPostNum, int postNum);

	int announcementNotifyTotalcount();

	List<AnnouncementVO> announcementNotify(int sqlPostNum, int postNum);

	int announcementEventTotalcount();

	List<AnnouncementVO> announcementEvent(int sqlPostNum, int postNum);

	int detailListTotalcount(String categoryType);

	List<AnnouncementVO> announcementDetailList(int sqlPostNum, int postNum, String categoryType);

}
