package com.study.demo.employee.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.demo.vo.AttachImageVO;


@Repository
public class AttachDAOImpl implements AttachDAO{
	
	@Autowired 
	private SqlSession sql;
	
	private static String namespace="attact";

	//이미지반환(출력)
	@Override
	public List<AttachImageVO> AttachImage(int emploNo) {
		return sql.selectList(namespace+".getAttachList",emploNo);
	}

	//이미지데이터삭제
	@Override
	public void imgDatedelete(AttachImageVO attachImagevo) {
		sql.update(namespace+".imgDatedelete", attachImagevo);
	}



}
