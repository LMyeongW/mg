package com.study.demo.employee.service;

import java.util.List;

import com.study.demo.vo.employeeVO;

public interface AdminService {


	/*회원승인리스트*/
	List<employeeVO> listPage(int sqlPostNum, int postNum, String searchKeyword);

	/*회원가입 상세페이지*/
	Object joinDetail(String employeeId);

	/*회원가입 승인*/
	void joinAppr(employeeVO employeevo);
	
	/*사원정보 조회*/
	employeeVO employeeSelect(int emploNo);
	
	/*사원정보수정*/
	void employeeUpdatePOST(employeeVO employeevo);
	
	/*사원정보 수정*/
	void employeeDetailPOST(employeeVO employeevo);
	
	/* 사원관리 페이징 전체갯수 */
	int emploTotalCount(String searchKeyword, String statusIdSelect);
	
	/*회원가입승인 페이징 전체갯수*/
	int jointotalCount(String searchKeyword);
	
	/*회원가입승인 삭제*/
	void joindelete(String employeeId);
	
	//회원가입 팝업 거절 목록
	List<employeeVO> refusalList(int sqlPostNum, int postNum);
	
	//회원가입팝업 페이징 갯수
	int refusaltotalCount();
	
	//회원가입 거절
	void refusalUpdate(employeeVO employeevo);
	
	//회원가입 거절 취소
	void cencelRefusal(employeeVO employeevo);
	
	//체크박스 삭제
	void selectDelete(List<String> employeeIdArray);
	
	void refusalSelectCancel(List<String> employeeIdArray);
	
	//list 정렬
	List<employeeVO> emploListSort(String orderType, int sqlPostNum, int postNum, String searchKeyword, String statusIdSelect);
	
	//퇴사자 list
	List<employeeVO> resignationList(int sqlPostNum, int postNum, String orderType, String searchKeyword);
	
	//퇴사자 총 갯수
	int resignationTotalCount(String searchKeyword);

	//퇴사자정보 조회
	Object resignationDetail(int emploNo);
	
	//퇴사자정보 수정
	void resignationDetailUpdate(employeeVO employeevo);
	
	//퇴사자삭제
	void resignationDelete(employeeVO employeevo);
	
	//퇴사자 선택삭제
	void resignationSelectDelete(List<String> employeeIdArray);

	List<employeeVO> statusSelect(String statusType);

	void applicationSelectDelete(List<String> applNoArray);



	
	//오름차순
	//void employeeSort(String asc);
	



	

	

	

}
