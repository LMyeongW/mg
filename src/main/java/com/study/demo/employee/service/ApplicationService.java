package com.study.demo.employee.service;


import java.util.List;

import com.study.demo.vo.ApplicationVO;

public interface ApplicationService {

	int submitPost(ApplicationVO appvo);

	List<ApplicationVO> submitlist(String employeeId);


	

}
