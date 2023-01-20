package com.study.demo.employee.service;


import java.util.List;

import com.study.demo.vo.ApplicationVO;

public interface ApplicationService {

	int submitPost(ApplicationVO appvo);

	List<ApplicationVO> submitlist(String employeeId, int sqlPostNum, int postNum);

	Object submitUpdateGet(int applNo);

	void submitUpdatePost(ApplicationVO applicationvo);

	int submitTotalcount(String employeeId);

	void submitCencel(ApplicationVO applicationvo);

	List<ApplicationVO> applicationList();

	Object applApprovalPage(int applNo);

	void applApprovalUpdate(ApplicationVO applicationvo);

	 



	


	

}
