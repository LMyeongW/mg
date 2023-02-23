package com.study.demo.employee.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import com.study.demo.vo.MyprofileVO;
import com.study.demo.vo.employeeVO;

public interface MemberService {
	//회원가입
	void employeeJoin(employeeVO employeevo);
	
	//아이디중복
	int idCheck(String employeeId);
	
	//로그인실행
	employeeVO employeeLogin(employeeVO employeevo);
	
	//이미지데이터저장
	void profileImgData(employeeVO employeevo);
	
	//이미지데이터반환
	List<MyprofileVO> profileImage(String employeeId);
	
	//이미지삭제
	void imgDatadelete(employeeVO employeevo);
	
	//아이이찾기
	employeeVO searchId(employeeVO employeevo);
	
	//비번찾기
	employeeVO searchPw(employeeVO employeevo);
	
	//비번변경
	void searchPwUpdate(employeeVO employeevo);
	
	//마이비번확인
	employeeVO mypwck(employeeVO employeevo);
	
	//마이비번변경
	void mypwch(employeeVO employeevo);




	


	
}
