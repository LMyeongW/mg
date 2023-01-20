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

	@Override
	public int submitPost(ApplicationVO appvo) {
		
		return applicationDao.submitPost(appvo);
	}

	@Override
	public List<ApplicationVO> submitlist(String employeeId, int sqlPostNum, int postNum) {
		return applicationDao.submitlist(employeeId, sqlPostNum, postNum);
	}

	@Override
	public Object submitUpdateGet(int applNo) {
		
		return applicationDao.submitUpdateGet(applNo);
	}

	@Override
	public void submitUpdatePost(ApplicationVO applicationvo) {
		applicationDao.submitUpdatePost(applicationvo);
		
	}

	@Override
	public int submitTotalcount(String employeeId) {
		return applicationDao.submitTotalcount(employeeId);
	}

	@Override
	public void submitCencel(ApplicationVO applicationvo) {
		applicationDao.submitCencel(applicationvo);
		
	}

	@Override
	public List<ApplicationVO> applicationList() {
		return applicationDao.applicationList();
	}

	@Override
	public Object applApprovalPage(int applNo) {
		return applicationDao.applApprovalPage(applNo);
	}

	@Override
	public void applApprovalUpdate(ApplicationVO applicationvo) {
		applicationDao.applApprovalUpdate(applicationvo);
		
	}




}
