package com.study.demo.employee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.demo.vo.ApplicationVO;

@Repository
public class ApplicationDAOImpl implements ApplicationDAO{
	
	@Autowired 
	private SqlSession sql;
	
	private static String namespace="app";

	@Override
	public int submitPost(ApplicationVO appvo) {
		
		return sql.insert(namespace+".submitPost", appvo);
	}

	@Override
	public List<ApplicationVO> submitlist(String employeeId) {
		
		return sql.selectList(namespace+".submitlist", employeeId);
	}


}
