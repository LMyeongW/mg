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
	
	//공지작성
	@Override
	public void announcementWrite(AnnouncementVO announcementvo) {
		announcementDao.announcementWrite(announcementvo);
	}
	
	//공지 메인 리스트 갯수
	@Override
	public int announcementTotalcount() {
		return announcementDao.announcementTotalcount();
	}
	
	//공지 메인 리스트
	@Override
	public List<AnnouncementVO> announcementList(int sqlPostNum, int postNum) {
		return announcementDao.announcementList(sqlPostNum, postNum);
	}
	
	//공지 상세페이지
	@Override
	public Object announcementDetail(int announcementNo) {
		return announcementDao.announcementDetail(announcementNo);
		
	}
	
	//공지 수정페이지
	@Override
	public Object announcementUpdateGET(int announcementNo) {
		return announcementDao.announcementUpdateGET(announcementNo);
	}
	
	//공지 수정
	@Override
	public void announcementUpdatePOST(AnnouncementVO announcementvo) {
		announcementDao.announcementUpdatePOST(announcementvo);
		
	}
	
	//공지 삭제
	@Override
	public void announcementDelete(int announcementNo) {
		announcementDao.announcementDelete(announcementNo);
		
	}
	
	//공지 전체리스트
	@Override
	public List<AnnouncementVO> announcementAll(int sqlPostNum, int postNum) {
		return announcementDao.announcementAll(sqlPostNum, postNum);
	}
	
	//공지사항 갯수
	@Override
	public int announcementNotifyTotalcount() {
		return announcementDao.announcementNotifyTotalcount();
	}
	
	//공지사항 리스트
	@Override	
	public List<AnnouncementVO> announcementNotify(int sqlPostNum, int postNum) {
		return announcementDao.announcementNotify(sqlPostNum, postNum);
	}
	
	//공지 이벤트 갯수
	@Override
	public int announcementEventTotalcount() {
		return announcementDao.announcementEventTotalcount();
	}
	
	//공지 이벤트 리스트
	@Override
	public List<AnnouncementVO> announcementEvent(int sqlPostNum, int postNum) {
		return announcementDao.announcementEvent(sqlPostNum, postNum);
	}
	
	//공지 상세페이지 리스트 갯수
	@Override
	public int detailListTotalcount(String categoryType) {
		return announcementDao.detailListTotalcount(categoryType);
	}
	
	//공지 상세페이지 리스트
	@Override
	public List<AnnouncementVO> announcementDetailList(int sqlPostNum, int postNum, String categoryType,  String detailNum) {
		return announcementDao.announcementDetailList(sqlPostNum, postNum, categoryType, detailNum);
	}
}
