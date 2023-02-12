package com.study.demo.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.demo.employee.dao.AnnouncementDAO;
import com.study.demo.vo.AnnouncementVO;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{
	
	@Autowired
	private AnnouncementDAO announcementDao;

	@Override
	public void announcementWrite(AnnouncementVO announcementvo) {
		announcementDao.announcementWrite(announcementvo);
	}

	@Override
	public int announcementTotalcount() {
		return announcementDao.announcementTotalcount();
	}

	@Override
	public List<AnnouncementVO> announcementList(int sqlPostNum, int postNum) {
		return announcementDao.announcementList(sqlPostNum, postNum);
	}

	@Override
	public Object announcementDetail(int announcementNo) {
		return announcementDao.announcementDetail(announcementNo);
		
	}

	@Override
	public Object announcementUpdateGET(int announcementNo) {
		return announcementDao.announcementUpdateGET(announcementNo);
	}

	@Override
	public void announcementUpdatePOST(AnnouncementVO announcementvo) {
		announcementDao.announcementUpdatePOST(announcementvo);
		
	}

	@Override
	public void announcementDelete(int announcementNo) {
		announcementDao.announcementDelete(announcementNo);
		
	}

	@Override
	public List<AnnouncementVO> announcementAll(int sqlPostNum, int postNum) {
		return announcementDao.announcementAll(sqlPostNum, postNum);
	}

	@Override
	public int announcementNotifyTotalcount() {
		return announcementDao.announcementNotifyTotalcount();
	}

	@Override
	public List<AnnouncementVO> announcementNotify(int sqlPostNum, int postNum) {
		return announcementDao.announcementNotify(sqlPostNum, postNum);
	}

	@Override
	public int announcementEventTotalcount() {
		return announcementDao.announcementEventTotalcount();
	}

	@Override
	public List<AnnouncementVO> announcementEvent(int sqlPostNum, int postNum) {
		return announcementDao.announcementEvent(sqlPostNum, postNum);
	}

	@Override
	public int detailListTotalcount(String categoryType) {
		return announcementDao.detailListTotalcount(categoryType);
	}

	@Override
	public List<AnnouncementVO> announcementDetailList(int sqlPostNum, int postNum, String categoryType) {
		return announcementDao.announcementDetailList(sqlPostNum, postNum, categoryType);
	}
}
