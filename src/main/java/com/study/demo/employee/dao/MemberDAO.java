package com.study.demo.employee.dao;

import com.study.demo.vo.employeeVO;

public interface MemberDAO {
	
	//회원가입
	void employeeJoin(employeeVO employeevo);
	
	//아이디 중복체크
	int idCheck(String employeeId);
	
	//로그인실행
	employeeVO employeeLogin(employeeVO employeevo);
}
