package com.study.demo.employee.dao;

import java.util.List;

import com.study.demo.vo.ApplicationVO;

public interface ApplicationDAO {

	int submitPost(ApplicationVO appvo);

	List<ApplicationVO> submitlist(String employeeId);

	

}
