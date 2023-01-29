package com.study.demo.employee.dao;

import java.util.List;

import com.study.demo.vo.ApplicationVO;

public interface ApplicationDAO {
	
	//신청서작성
	int submitPost(ApplicationVO appvo);
	
	//메인페이지 신청서 리스트
	List<ApplicationVO> submitlist(String employeeId, int sqlPostNum, int postNum);
	
	//메인페이지 신청서 리스트 총갯수
	int submitTotalcount(String employeeId);
	
	//신청서 수정페이지 출력
	Object submitUpdateGet(int applNo);

	//신청서 수정
	void submitUpdatePost(ApplicationVO applicationvo);
	
	//신청취소
	void submitCencel(ApplicationVO applicationvo);
	
	//권한페이지 신청리스트
	List<ApplicationVO> applicationList(int sqlPostNum, int postNum, String searchKeyword);
	
	//권한페이지 신청서 수정페이지 출력
	Object applApprovalPage(int applNo);
	
	//권한페이지 신청서 수정
	void applApprovalUpdate(ApplicationVO applicationvo);
	
	//권한페이지 신청서 삭제
	void applApprovalDelete(ApplicationVO applicationvo);
	
	//신청서 총갯수
	int applTotalCount(String searchKeyword);

	

}
