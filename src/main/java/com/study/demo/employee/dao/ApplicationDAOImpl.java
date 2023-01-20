package com.study.demo.employee.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.demo.vo.ApplicationVO;
import com.study.demo.vo.employeeVO;

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
	public List<ApplicationVO> submitlist(String employeeId, int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("employeeId", employeeId);
		return  sql.selectList(namespace+".submitlist", data);
	}
	
	@Override
	public int submitTotalcount(String employeeId) {
		return sql.selectOne(namespace+".submitTotalcount", employeeId);
	}

	@Override
	public Object submitUpdateGet(int applNo) {
		return sql.selectOne(namespace+".submitUpdateGet", applNo);
	}

	@Override
	public void submitUpdatePost(ApplicationVO applicationvo) {
		sql.update(namespace+".submitUpdatePost", applicationvo);
	}

	@Override
	public void submitCencel(ApplicationVO applicationvo) {
		sql.update(namespace+".submitCencel", applicationvo);
	}

	@Override
	public List<ApplicationVO> applicationList() {
		return sql.selectList(namespace+".applicationList");
	}

	@Override
	public Object applApprovalPage(int applNo) {
		return sql.selectOne(namespace+".applApprovalPage", applNo);
		
	}

	@Override
	public void applApprovalUpdate(ApplicationVO applicationvo) {
		 sql.update(namespace+".applApprovalUpdate", applicationvo);
	}




}
