package com.study.demo.employee.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.demo.vo.AnnouncementVO;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO{
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace="announcement";
	
	//공지작성
	@Override
	public void announcementWrite(AnnouncementVO announcementvo) {
		sql.insert(namespace+".announcementWrite", announcementvo);
	}
	
	//공지 갯수
	@Override
	public int announcementTotalcount() {
		return sql.selectOne(namespace+".announcementTotalcount");
	}
	
	//공지 메인페이지 리스트
	@Override
	public List<AnnouncementVO> announcementList(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementList",data);
	}
	
	//공지 상세페이지
	@Override
	public Object announcementDetail(int announcementNo) {
		return sql.selectOne(namespace+".announcementDetail", announcementNo);
	}
	
	//공지 수정페이지
	@Override
	public Object announcementUpdateGET(int announcementNo) {
		return  sql.selectOne(namespace+".announcementUpdateGET", announcementNo);
	}
	
	//공지 수정
	@Override
	public void announcementUpdatePOST(AnnouncementVO announcementvo) {
		sql.update(namespace+".announcementUpdatePOST", announcementvo);
		
	}
	
	//공지 삭제
	@Override
	public void announcementDelete(int announcementNo) {
		sql.delete(namespace+".announcementDelete", announcementNo);
	}
	
	//공지 전체 리스트
	@Override
	public List<AnnouncementVO> announcementAll(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementAll", data);
	}
	
	//공지사항 갯수
	@Override
	public int announcementNotifyTotalcount() {
		return sql.selectOne(namespace+".announcementNotifyTotalcount");
	}
	
	//공지사항 리스트
	@Override
	public List<AnnouncementVO> announcementNotify(int sqlPostNum, int postNum) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementNotify", data);
	}
	
	//공지 이벤트 갯수
	@Override
	public int announcementEventTotalcount() {
		return sql.selectOne(namespace+".announcementEventTotalcount");
	}
	
	//공지 이벤트 리스트
	@Override
	public List<AnnouncementVO> announcementEvent(int sqlPostNum, int postNum) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementEvent", data);
	}
	
	//공지 상세페이지 갯수
	@Override
	public int detailListTotalcount(String categoryType) {
		return sql.selectOne(namespace+".detailListTotalcount", categoryType);
	}
	
	//공지 상세페이지 리스트
	@Override
	public List<AnnouncementVO> announcementDetailList(int sqlPostNum, int postNum, String categoryType, String detailNum) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("categoryType", categoryType);
		data.put("detailNum", detailNum);
		
		return sql.selectList(namespace+".announcementDetailList", data);
	}

}
