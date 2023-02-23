package com.study.demo.employee.dao;


import java.util.HashMap;
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
	
	//이미지 데이터저장
	void profileImgData(employeeVO employeevo);
	
	//이미지 데이터반환
	List<MyprofileVO> profileImage(String employeeId);
	
	//이미지데이터 삭제
	void imgDatadelete(employeeVO employeevo);
	
	//아이디찾기
	employeeVO searchId(employeeVO employeevo);
	
	//비번찾기
	employeeVO searchPw(employeeVO employeevo);
	
	//비번변경
	void searchPwUpdate(employeeVO employeevo);
	
	//마이페이지 비번 확인
	employeeVO mypwck(employeeVO employeevo);
	
	//마이페이지 비번 변경
	void mypwch(employeeVO employeevo);

	
}
