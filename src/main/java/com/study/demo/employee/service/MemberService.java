package com.study.demo.employee.service;

import com.study.demo.vo.employeeVO;

public interface MemberService {
	//회원가입
	void employeeJoin(employeeVO employeevo);
	
	//아이디중복
	int idCheck(String employeeId);
	
	//로그인실행
	employeeVO employeeLogin(employeeVO employeevo);


}
