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
	public List<ApplicationVO> submitlist(String employeeId) {
		return applicationDao.submitlist(employeeId);
	}


}
