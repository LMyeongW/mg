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

	//신청서작성
	@Override
	public int submitPost(ApplicationVO appvo) {
		return sql.insert(namespace+".submitPost", appvo);
	}
	
	//메인페이지 신청서 리스트
	@Override
	public List<ApplicationVO> submitlist(String employeeId, int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("employeeId", employeeId);
		return  sql.selectList(namespace+".submitlist", data);
	}
	
	//메인페이지 신청서 리스트 총갯수
	@Override
	public int submitTotalcount(String employeeId) {
		return sql.selectOne(namespace+".submitTotalcount", employeeId);
	}
	
	//신청서 수정페이지 출력
	@Override
	public Object submitUpdateGet(int applNo) {
		return sql.selectOne(namespace+".submitUpdateGet", applNo);
	}
	
	//신청서 수정
	@Override
	public void submitUpdatePost(ApplicationVO applicationvo) {
		sql.update(namespace+".submitUpdatePost", applicationvo);
	}
	
	//신청취소
	@Override
	public void submitCencel(ApplicationVO applicationvo) {
		sql.update(namespace+".submitCencel", applicationvo);
	}
	
	//권한페이지 신청리스트
	@Override
	public List<ApplicationVO> applicationList(int sqlPostNum, int postNum, String searchKeyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("searchKeyword", searchKeyword);
		
		return sql.selectList(namespace+".applicationList", data);
	}
	
	//신청서 갯수
	@Override
	public int applTotalCount(String searchKeyword) {
		return sql.selectOne(namespace+".applTotalCount", searchKeyword);
	}

	
	//권한페이지 신청서 수정페이지 출력
	@Override
	public Object applApprovalPage(int applNo) {
		return sql.selectOne(namespace+".applApprovalPage", applNo);
	}
	
	//권한페이지 신청서 수정
	@Override
	public void applApprovalUpdate(ApplicationVO applicationvo) {
		 sql.update(namespace+".applApprovalUpdate", applicationvo);
	}
	
	//권한페이지 신청서 삭제
	@Override
	public void applApprovalDelete(ApplicationVO applicationvo) {
		sql.delete(namespace+".applApprovalDelete", applicationvo);
		
	}





}
