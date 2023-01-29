package com.study.demo.employee.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.demo.employee.dao.ApplicationDAO;
import com.study.demo.vo.ApplicationVO;

@Service
public class ApplicationServiceImpl implements ApplicationService{
	
	@Autowired
	private ApplicationDAO applicationDao;
	
	//신청서작성
	@Override
	public int submitPost(ApplicationVO appvo) {
		return applicationDao.submitPost(appvo);
	}
	
	//메인페이지 신청서 리스트
	@Override
	public List<ApplicationVO> submitlist(String employeeId, int sqlPostNum, int postNum) {
		return applicationDao.submitlist(employeeId, sqlPostNum, postNum);
	}
	
	//메인페이지 신청서 리스트 총갯수
	@Override
	public int submitTotalcount(String employeeId) {
		return applicationDao.submitTotalcount(employeeId);
	}
	
	//신청서 수정페이지 출력
	@Override
	public Object submitUpdateGet(int applNo) {
		return applicationDao.submitUpdateGet(applNo);
	}
	
	//신청서 수정
	@Override
	public void submitUpdatePost(ApplicationVO applicationvo) {
		applicationDao.submitUpdatePost(applicationvo);
	}
	
	//신청취소
	@Override
	public void submitCencel(ApplicationVO applicationvo) {
		applicationDao.submitCencel(applicationvo);
	}
	
	//권한페이지 신청리스트
	@Override
	public List<ApplicationVO> applicationList(int sqlPostNum, int postNum, String searchKeyword) {
		return applicationDao.applicationList(sqlPostNum, postNum, searchKeyword);
	}
	
	//권한페이지 신청서 수정페이지 출력
	@Override
	public Object applApprovalPage(int applNo) {
		return applicationDao.applApprovalPage(applNo);
	}
	
	//권한페이지 신청서 수정
	@Override
	public void applApprovalUpdate(ApplicationVO applicationvo) {
		applicationDao.applApprovalUpdate(applicationvo);
	}
	
	//권한페이지 신청서 삭제
	@Override
	public void applApprovalDelete(ApplicationVO applicationvo) {
		applicationDao.applApprovalDelete(applicationvo);
	}
	
	//신청서 총갯수
	@Override
	public int applTotalCount(String searchKeyword) {
		return applicationDao.applTotalCount(searchKeyword);
	}




}
