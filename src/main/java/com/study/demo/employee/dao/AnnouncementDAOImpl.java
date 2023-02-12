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

	@Override
	public void announcementWrite(AnnouncementVO announcementvo) {
		sql.insert(namespace+".announcementWrite", announcementvo);
	}

	@Override
	public int announcementTotalcount() {
		return sql.selectOne(namespace+".announcementTotalcount");
	}

	@Override
	public List<AnnouncementVO> announcementList(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementList",data);
	}

	@Override
	public Object announcementDetail(int announcementNo) {
		return sql.selectOne(namespace+".announcementDetail", announcementNo);
	}

	@Override
	public Object announcementUpdateGET(int announcementNo) {
		return  sql.selectOne(namespace+".announcementUpdateGET", announcementNo);
	}

	@Override
	public void announcementUpdatePOST(AnnouncementVO announcementvo) {
		sql.update(namespace+".announcementUpdatePOST", announcementvo);
		
	}

	@Override
	public void announcementDelete(int announcementNo) {
		sql.delete(namespace+".announcementDelete", announcementNo);
	}

	@Override
	public List<AnnouncementVO> announcementAll(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementAll", data);
	}

	@Override
	public int announcementNotifyTotalcount() {
		return sql.selectOne(namespace+".announcementNotifyTotalcount");
	}

	@Override
	public List<AnnouncementVO> announcementNotify(int sqlPostNum, int postNum) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementNotify", data);
	}

	@Override
	public int announcementEventTotalcount() {
		return sql.selectOne(namespace+".announcementEventTotalcount");
	}

	@Override
	public List<AnnouncementVO> announcementEvent(int sqlPostNum, int postNum) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".announcementEvent", data);
	}

	@Override
	public int detailListTotalcount(String categoryType) {
		return sql.selectOne(namespace+".detailListTotalcount", categoryType);
	}

	@Override
	public List<AnnouncementVO> announcementDetailList(int sqlPostNum, int postNum, String categoryType) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("categoryType", categoryType);
		
		return sql.selectList(namespace+".announcementDetailList", data);
	}

}
