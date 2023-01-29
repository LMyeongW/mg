package com.study.demo.employee.dao;

import java.io.File;
import java.util.List;

import com.study.demo.vo.MyprofileVO;
import com.study.demo.vo.employeeVO;

public interface MemberDAO {
	
	//회원가입
	void employeeJoin(employeeVO employeevo);
	
	//아이디 중복체크
	int idCheck(String employeeId);
	
	//로그인실행
	employeeVO employeeLogin(employeeVO employeevo);

	void profileImgData(employeeVO employeevo);

	List<MyprofileVO> profileImage(String employeeId);

	void imgDatadelete(employeeVO employeevo);
}
